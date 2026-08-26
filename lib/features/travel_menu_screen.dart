import 'package:flutter/material.dart';
import '../dataHandler/country_details.dart';
import 'package:my_app/widgets/menu_panel.dart';
import 'package:my_app/widgets/landmark_panel.dart';
import 'documents.dart';
import 'package:my_app/models/travel_models.dart';
import 'package:my_app/widgets/dishPanel.dart';

import 'package:my_app/globals.dart' as globals;
import 'package:my_app/dataHandler/airports_data.dart';
import 'package:my_app/widgets/airportPanel.dart';

import 'package:my_app/mapcode/main_map.dart';

import 'package:my_app/widgets/weather_card.dart';

class TravelMenuScreen extends StatefulWidget {
  const TravelMenuScreen({super.key});

  @override
  State<TravelMenuScreen> createState() => _TravelMenuScreenState();
}

class _TravelMenuScreenState extends State<TravelMenuScreen> {
  late Country selectedCountry;
  Map<String, bool> bookmarkedLandmarks = {};

  @override
  void initState() {
    super.initState();
    selectedCountry = southeastAsianCountries[0];
  }

  void toggleBookmark(String landmarkName) {
    setState(() {
      bookmarkedLandmarks[landmarkName] =
          !(bookmarkedLandmarks[landmarkName] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

      floatingActionButton: globals.isFromChat
          ? Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              child: FloatingActionButton(
                mini: false,
                shape: const CircleBorder(),
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.white,
                onPressed: () {
                  globals.isFromChat = false;
                  Navigator.pop(context);
                },
                child: const Icon(Icons.chat, size: 28), 
              ),
            )
          : null,

      backgroundColor: const Color(0xFFF8FAF8), 
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1B5E20), Color(0xFF388E3C)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Let's Travel",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Explore Southeast Asia',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.flight_takeoff,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
 SearchAnchor(
viewElevation: 8,
  viewShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  viewConstraints: const BoxConstraints(
    maxWidth: 350, 
    maxHeight: 400,
  ),
  
  builder: (BuildContext context, SearchController controller) {
    return SearchBar(
      controller: controller,
      hintText: "Search SEA Country...",
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      onTap: () => controller.openView(),
      onChanged: (_) => controller.openView(),
      leading: const Icon(Icons.search, color: Colors.grey),
    );
  },
  
  suggestionsBuilder: (BuildContext context, SearchController controller) {
    final keyword = controller.value.text.toLowerCase();
    return southeastAsianCountries
        .where((c) => c.name.toLowerCase().contains(keyword))
        .map((c) {
      return ListTile(
        title: Text(c.name),
        onTap: () {
          controller.closeView(c.name);
          setState(() {
            selectedCountry = c;
          });
        },
      );
    }).toList();
  },
),               
                  ],
                ),
              ),

              /// 📜 List Content
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildWeatherCard(selectedCountry.weather),
                    const SizedBox(height: 20),

                    StyledDropdown(
                      key: ValueKey("${selectedCountry.name}_about"),
                      title: "About ${selectedCountry.name}",
                      items: [
                        selectedCountry.details,
                      ], // Put in brackets because items expects a List
                      icon: Icons.auto_stories_outlined,
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          key: ValueKey("${selectedCountry.name}_airports_exp"),
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          leading: const Icon(
                            Icons.local_airport_rounded,
                            color: Color(
                              0xFF388E3C,
                            ), 
                          ),
                          title: const Text(
                            "AIRPORTS",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          children: [
                            Container(
                              color: Colors.white,
                              constraints: const BoxConstraints(maxHeight: 400),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child:
                                    (countryAirportsData.containsKey(
                                      selectedCountry.name,
                                    ))
                                    ? AirportPanel(
                                        data: {
                                          selectedCountry.name:
                                              countryAirportsData[selectedCountry
                                                  .name]!,
                                        },
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "No airport data available for this country.",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    StyledDropdown(
                      key: ValueKey("${selectedCountry.name}_rules"),
                      title: "Country Rules",
                      items: selectedCountry.rules,
                      icon: Icons.gavel_outlined,
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          key: ValueKey("${selectedCountry.name}_dishes_exp"),
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          leading: const Icon(
                            Icons.restaurant_menu_outlined,
                            color: Colors.green,
                          ),
                          title: const Text(
                            "LOCAL DISHES",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          children: [
                            Container(
                              color: Colors.white,
                              constraints: const BoxConstraints(
                                maxHeight: 450,
                              ), // Keeps the panel from being too tall
                              child: DishPanel(countryName: "Malaysia"),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4CAF50).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          leading: const Icon(
                            Icons.photo_library_outlined,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "VIEW LANDMARKS",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          children: [
                            Container(
                              color: Colors
                                  .white,
                              constraints: const BoxConstraints(
                                maxHeight: 450,
                              ), 
                              child: LandmarkPanel(
                                landmarks: selectedCountry.landmarks,
                                bookmarkedLandmarks: bookmarkedLandmarks,
                                onBookmarkToggle: toggleBookmark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    _buildGradientButton(
                      context: context,
                      label: "TRAVEL REQUIREMENTS",
                      icon: Icons.assignment_outlined,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DocumentsPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 80), // Space for FAB
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            right: 20,
            bottom: 30,
            child: FloatingActionButton.extended(
              heroTag: "map_btn",
              backgroundColor: const Color(0xFF1B5E20),
              elevation: 4,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TravelMapScreen(),
                  ),
                );
              },
              label: const Text(
                "MAP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(Icons.map_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard(Weather weather) {
    return WeatherCard(weather: weather);
  }

  Widget _buildPrimaryButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildGradientButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD600), Color(0xFFFFB300)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class StyledDropdown extends StatelessWidget {
  final String title;
  final List<String> items;
  final IconData icon;

  const StyledDropdown({
    super.key,
    required this.title,
    required this.items,
    this.icon = Icons.info_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: const Color(0xFF388E3C)),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          children: items
              .map(
                (item) => ListTile(
                  contentPadding: const EdgeInsets.only(left: 70, right: 20),
                  title: Text(
                    item,
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                  ),
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  leading: const Icon(
                    Icons.circle,
                    size: 6,
                    color: Colors.green,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
