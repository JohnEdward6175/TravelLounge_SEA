import 'package:flutter/material.dart';
import 'dart:ui';
// 1. ADDED THIS: The blueprint for what a 'Country' is
import 'models/travel_models.dart'; 
// 2. ADDED THIS: The actual data list (southeastAsianCountries)
import 'dataHandler/country_details.dart'; 

import 'widgets/weather_card.dart';
import 'services/weather_api_service.dart';
import 'chatCode/data/chatUI.dart';

import 'features/currency_converter.dart';
import 'features/myBag.dart';
import 'features/documents.dart';
import 'package:my_app/globals.dart' as globals;

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

  // Path to the AirportPanel widget we made

class FeaturesScreen extends StatefulWidget {
  const FeaturesScreen({super.key});

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  Country? selectedCountry;
  late TextEditingController _searchController;
  List<Country> filteredCountries = [];
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

IconData _getWeatherIcon(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Icons.wb_sunny_rounded;
    case 'cloudy':
      return Icons.cloud_rounded;
    case 'rainy':
      return Icons.grain_rounded; // or Icons.water_drop_rounded
    case 'storm':
      return Icons.thunderstorm_rounded;
    case 'humid': // Added this case
      return Icons.air_rounded;
    default:
      return Icons.wb_cloudy_rounded;
  }
}

final WeatherService _weatherService = WeatherService();
  
  // New: Holds the current weather data
  Weather? _currentWeather;
  bool _isLoading = true;


  // New: Method to call the service
  Future<void> _loadWeather(String countryName) async {
  setState(() => _isLoading = true);
  final prefs = await SharedPreferences.getInstance();
  
  try {
    // 1. Try to fetch fresh data
    final weather = await _weatherService.fetchWeather(countryName);
    
    // 2. If successful, save it as a JSON string
    await prefs.setString('weather_$countryName', jsonEncode(weather.toJson()));
    
    setState(() {
      _currentWeather = weather;
      _isLoading = false;
    });
  } catch (e) {
    // 3. If it fails (offline), try to load from cache
    final cachedData = prefs.getString('weather_$countryName');
    if (cachedData != null) {
      setState(() {
        _currentWeather = Weather.fromJson(jsonDecode(cachedData));
        _isLoading = false;
      });
    } else {
      // 4. Handle case where there is no internet AND no cache
      setState(() => _isLoading = false);
    }
  }
}

 @override
  void initState() {
    super.initState();
    // 1. Keep your existing setup
    selectedCountry = southeastAsianCountries[0];
    filteredCountries = southeastAsianCountries;
    _searchController = TextEditingController();

    // 2. Trigger the service to load the weather for the first country
    // We call this here so the app fetches data immediately on launch
    _loadWeather(selectedCountry!.name); 
  }

  @override
  void dispose() {
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredCountries = southeastAsianCountries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    _showOverlay();
  }

void _selectCountry(Country country) {
  setState(() {
    selectedCountry = country;
    _searchController.text = country.name;
    _removeOverlay();
  });
  
  // Add this line to fetch new weather when a country is selected:
  _loadWeather(country.name);
}
  void _showOverlay() {
    _removeOverlay();
    final overlay = Overlay.of(context);
    if (filteredCountries.isEmpty) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width - 32,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = filteredCountries[index];
                  return ListTile(
                    title: Text(country.name),
                    trailing: Text(country.code, style: const TextStyle(color: Colors.grey)),
                    onTap: () => _selectCountry(country),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

floatingActionButton: globals.isFromChat 
  ? Padding(
      padding: const EdgeInsets.only(top: 30.0), // Moves it down from the very top edge
      child: FloatingActionButton(
        // Set to false or remove 'mini' to make it standard (bigger) size
        mini: false, 
        // This shape makes it a perfect circle
        shape: const CircleBorder(), 
        backgroundColor: Colors.yellow, 
        foregroundColor: Colors.white, 
        onPressed: () {
          globals.isFromChat = false; 
          Navigator.pop(context); 
        },
        child: const Icon(Icons.chat, size: 28), // Increased icon size
      ),
    )
  : null,

      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          DashboardHeader(
            headerText: "Browse Countries",
            searchController: _searchController,
            onSearchChanged: _onSearchChanged,
            layerLink: _layerLink,
            gradientColors: [Colors.yellow.shade800, Colors.orange.shade500],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (selectedCountry != null) ...[
                    _buildWeatherCard(),
                    const SizedBox(height: 24),
                    
                    FeatureButton(
                      label: "My Documents",
                      icon: Icons.description_rounded,
                      color: Colors.orange.shade700,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DocumentsPage())),
                    ),
                    const SizedBox(height: 12),
                    FeatureButton(
                      label: "What's in my Bag?",
                      icon: Icons.backpack_rounded,
                      color: Colors.blueAccent.shade700,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBagPage())),
                    ),
                    const SizedBox(height: 12),
                    FeatureButton(
                      label: "Budget Planner",
                      icon: Icons.currency_exchange_rounded,
                      color: Colors.green.shade700,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CurrencyConverterScreen())),
                    ),
                    
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),

                    _buildChatBotButton(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildWeatherCard() {
  // If loading, show the spinner
  if (_isLoading) {
    return const Center(child: CircularProgressIndicator());
  }
  
  // If we have data, show your new widget
  if (_currentWeather != null) {
    return WeatherCard(weather: _currentWeather!);
  }
  
  // Fallback if something went wrong
  return const Text("No weather data available");
}
  
  Widget _buildChatBotButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(colors: [Color(0xFFFDD835), Color(0xFFFBC02D)]),
        boxShadow: [
          BoxShadow(color: Colors.yellow.shade700.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatBotScreen())),
        icon: const Icon(Icons.smart_toy_rounded, color: Colors.black87),
        label: const Text("ASK TRAVEL ASSISTANT", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}

// ----------------- Modern Feature Button Widget -----------------
class FeatureButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const FeatureButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: ListTile(
        onTap: onPressed,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: color),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

// ----------------- DashboardHeader -----------------
class DashboardHeader extends StatelessWidget {
  final String headerText;
  final TextEditingController searchController;
  final void Function(String)? onSearchChanged;
  final LayerLink layerLink;
  final List<Color> gradientColors;

  const DashboardHeader({
    super.key,
    required this.headerText,
    required this.searchController,
    required this.onSearchChanged,
    required this.layerLink,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 30),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.explore_rounded, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              Text(headerText, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          CompositedTransformTarget(
            link: layerLink,
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search destinations...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}