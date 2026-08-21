import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'data/landmark_map.dart';
import 'data/airport_map.dart';
import 'data/asean_capitals.dart';

import 'package:my_app/features/travel_menu_screen.dart';

void main() => runApp(const MaterialApp(home: TravelMapScreen()));

class TravelMapScreen extends StatefulWidget {
  const TravelMapScreen({super.key});
  @override
  State<TravelMapScreen> createState() => _TravelMapScreenState();
}

class _TravelMapScreenState extends State<TravelMapScreen> {
  final MapController _mapController = MapController();
  final ScrollController _listScrollController = ScrollController();
  final List<ExpansionTileController> _tileControllers = [];
  String? _currentSearchValue;

  LatLng? _getCoords(String name) {
    // 1. Search Landmarks
    final landmarks =
        countryData[_selectedCountryName]!['landmarks'] as List<dynamic>;
    final landmark = landmarks.cast<Map<String, dynamic>>().firstWhere(
      (l) => l['name'] == name,
      orElse: () => {},
    );
    if (landmark.isNotEmpty) return LatLng(landmark['lat'], landmark['lng']);

    // 2. Search Airports
    final airportsData = countryAirportsData[_selectedCountryName] ?? {};
    final allAirports = [
      ...(airportsData['International'] as List<dynamic>? ?? []),
      ...(airportsData['Local'] as List<dynamic>? ?? []),
    ];
    final airport = allAirports.cast<Map<String, dynamic>>().firstWhere(
      (a) => a['name'] == name,
      orElse: () => {},
    );
    if (airport.isNotEmpty) return LatLng(airport['lat'], airport['lng']);

    return null; // Return null safely if nothing is found
  }

  LatLng _getCoordsForAirport(String airportName) {
    final airportsData = countryAirportsData[_selectedCountryName] ?? {};
    final List<dynamic> allAirports = [
      ...(airportsData['International'] ?? []),
      ...(airportsData['Local'] ?? []),
    ];

    final airport = allAirports.firstWhere((a) => a['name'] == airportName);
    return LatLng(airport['lat'], airport['lng']);
  }

  LatLng _getCoordsForLandmark(String landmarkName) {
    final data = countryData[_selectedCountryName]!;
    final List<dynamic> landmarks = data['landmarks'] ?? [];

    final landmark = landmarks.firstWhere((l) => l['name'] == landmarkName);
    return LatLng(landmark['lat'], landmark['lng']);
  }

  // Call this whenever the country changes
  void _syncControllers(int count) {
    _tileControllers.clear();
    for (int i = 0; i < count; i++) {
      _tileControllers.add(ExpansionTileController());
    }
  }

  void _handleSearchSelection(String name) {
    int index = -1;

    if (_viewMode == 'Landmarks') {
      // RESTORED: Landmark logic
      final landmarks =
          countryData[_selectedCountryName]!['landmarks'] as List<dynamic>;
      index = landmarks.indexWhere((l) => l['name'] == name);

      if (index != -1) {
        final landmarkData = landmarks[index];
        _mapController.move(
          LatLng(landmarkData['lat'], landmarkData['lng']),
          10.0,
        );
        _listScrollController.animateTo(
          index * 150.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        if (_tileControllers.length > index) {
          _tileControllers[index].expand();
        }
      }
    } else {
      // NEW: Airport logic
      final airportsData = countryAirportsData[_selectedCountryName] ?? {};
      final allAirports = [
        ...(airportsData['International'] ?? []),
        ...(airportsData['Local'] ?? []),
      ];
      index = allAirports.indexWhere((a) => a['name'] == name);

      if (index != -1) {
        final airportData = allAirports[index];
        _mapController.move(
          LatLng(airportData['lat'], airportData['lng']),
          10.0,
        );
        _listScrollController.animateTo(
          index * 80.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        if (_tileControllers.length > index) {
          _tileControllers[index].expand();
        }
      }
    }

    setState(() {
      _highlightedIndex = index;
      _isPanelExpanded = true;
    });
  }

  String _selectedCountryName = "Philippines";
  String _viewMode = 'Landmarks';
  double _currentZoom = 6.0;
  bool _isPanelExpanded = true;
  int _highlightedIndex = -1;

  // Transport State Variables
  String? _origin;
  String? _destination;
  List<LatLng> _routePoints = [];

  @override
  Widget build(BuildContext context) {
    final data = countryData[_selectedCountryName]!;
    final List<dynamic> landmarks = data['landmarks'] ?? [];
    final airportsData = countryAirportsData[_selectedCountryName] ?? {};
    final List<dynamic> allAirports = [
      ...(airportsData['International'] ?? []),
      ...(airportsData['Local'] ?? []),
    ];

    // Define current view data and filter out invalid search selections
    final List<dynamic> currentList = _viewMode == 'Landmarks'
        ? landmarks
        : allAirports;
    final List<String> currentItemNames = currentList
        .map((item) => item['name'] as String)
        .toList();

    // This keeps the search bar stable when switching modes
    if (_currentSearchValue != null &&
        !currentItemNames.contains(_currentSearchValue)) {
      _currentSearchValue = null;
    }

    final int itemCount = currentList.length;
    if (_tileControllers.length != itemCount) {
      _syncControllers(itemCount);
    }

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(data['lat'], data['lng']),
              initialZoom: _currentZoom,
              onPositionChanged: (pos, _) =>
                  setState(() => _currentZoom = pos.zoom ?? 6.0),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.my_app',
              ),
              // Route visualization
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: _routePoints,
                    color: Colors.green,
                    strokeWidth: 5.0,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  // 1. Browsing Modes: Only show markers for the active mode
                  if (_viewMode == 'Landmarks')
                    ...landmarks.asMap().entries.map(
                      (e) => Marker(
                        point: LatLng(e.value['lat'], e.value['lng']),
                        child: GestureDetector(
                          onTap: () {
                            // 1. Zoom to the landmark
                            _mapController.move(
                              LatLng(e.value['lat'], e.value['lng']),
                              12.0,
                            );

                            // 2. Keep your existing logic
                            setState(() {
                              _highlightedIndex = e.key;
                              _isPanelExpanded = true;
                            });
                            _listScrollController.animateTo(
                              e.key * 150.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            if (_tileControllers.length > e.key)
                              _tileControllers[e.key].expand();
                          },
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.green,
                            size: 40,
                          ),
                        ),
                      ),
                    ),

                  if (_viewMode == 'Airports')
                    ...allAirports.asMap().entries.map(
                      (e) => Marker(
                        point: LatLng(e.value['lat'], e.value['lng']),
                        child: GestureDetector(
                          onTap: () {
                            _mapController.move(LatLng(e.value['lat'], e.value['lng']), 12.0);
                            setState(() {
                              _highlightedIndex = e.key;
                              _isPanelExpanded = true;
                            });
                            _listScrollController.animateTo(
                              e.key * 80.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            if (_tileControllers.length > e.key) {
                              _tileControllers[e.key].expand();
                            }
                          },
                          child: Icon(
                            Icons.local_airport,
                            color: _highlightedIndex == e.key ? Colors.lightBlueAccent : Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                    ),

                  //country pin
                  ...aseanCapitals.map(
                    (capital) => Marker(
                      // Set the anchor to center the marker over the LatLng point
                      alignment: Alignment.topCenter,
                      width: 100.0, // Define a sufficient width
                      height:
                          80.0, // Define a sufficient height to prevent overflow
                      point: LatLng(capital['lat'], capital['lng']),
                      child: GestureDetector(
                        onTap: () {
                          // This will now trigger regardless of where the user taps (text or icon)
                          _mapController.move(
                            LatLng(capital['lat'], capital['lng']),
                            10.0,
                          );
                          setState(() => _isPanelExpanded = true);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              capital['name'],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.white70,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 2. destination tracking chu chu
                  if (_origin != null)
                    Marker(
                      point: _getCoords(_origin!) ?? LatLng(0, 0),
                      child: GestureDetector(
                        onTap: () {
                          final coords = _getCoords(_origin!);
                          if (coords != null) {
                            _mapController.move(coords, 12.0);
                            setState(() => _isPanelExpanded = true);
                          }
                        },
                        child: Icon(
                          ((countryData[_selectedCountryName]!['landmarks'] as List<dynamic>)
                                  .any((item) => item['name'] == _origin))
                              ? Icons.location_pin
                              : Icons.local_airport,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                  if (_destination != null)
                    Marker(
                      point: _getCoords(_destination!) ?? LatLng(0, 0),
                      child: GestureDetector(
                        onTap: () {
                          final coords = _getCoords(_destination!);
                          if (coords != null) {
                            _mapController.move(coords, 12.0);
                            setState(() => _isPanelExpanded = true);
                          }
                        },
                        child: Icon(
                          ((countryData[_selectedCountryName]!['landmarks'] as List<dynamic>)
                                  .any((item) => item['name'] == _destination))
                              ? Icons.location_pin
                              : Icons.local_airport,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ),


                  // 3. ASEAN Capitals
                  if (_viewMode ==
                      'ASEAN') // Ensure you add 'ASEAN' as a valid option in your _viewMode logic
                    ...aseanCapitals.map(
                      (capital) => Marker(
                        point: LatLng(capital['lat'], capital['lng']),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                            Text(
                              capital['name'],
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors
                                    .white70, // Added background for readability
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),



          // SEARCH BAR
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 10),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: _currentSearchValue,
                                hint: Text(
                                  _viewMode == 'Landmarks'
                                      ? "Search ${_selectedCountryName} landmark..."
                                      : "Search ${_selectedCountryName} airport...",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                items: currentItemNames.map((name) {
                                  return DropdownMenuItem<String>(
                                    value: name,
                                    child: Text(name),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() => _currentSearchValue = val);
                                  if (val != null) _handleSearchSelection(val);
                                },
                              ),
                            ),
                          ),
                          PopupMenuButton<String>(
                            icon: const Icon(
                              Icons.public,
                              color: Color(0xFF1B5E20),
                            ),
                            onSelected: (name) => setState(() {
                              _selectedCountryName = name;
                              _currentSearchValue = null;
                              _highlightedIndex = -1;

                              // AUTOMATICALLY CLEAR TRACKING DATA
                              _origin = null;
                              _destination = null;
                              _routePoints = [];
                            }),
                            itemBuilder: (context) => countryData.keys
                                .map(
                                  (name) => PopupMenuItem(
                                    value: name,
                                    child: Text(name),
                                  ),
                                )
                                .toList(),
                          ),

                          IconButton(
                            icon: Icon(
                              Icons.local_airport,
                              color: _viewMode == 'Airports'
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            onPressed: () => setState(() {
                              _viewMode = (_viewMode == 'Landmarks')
                                  ? 'Airports'
                                  : 'Landmarks';
                              _currentSearchValue = null;
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: const Color(0xFF1B5E20),
                    onPressed: () {
                      final newData = countryData[_selectedCountryName]!;
                      _mapController.move(
                        LatLng(newData['lat'], newData['lng']),
                        6.0,
                      );
                      setState(() {
                        _highlightedIndex = -1;
                        _isPanelExpanded = true;
                      });
                    },
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // ZOOM SLIDER
          Positioned(
            right: 10,
            top: 200,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: RotatedBox(
                quarterTurns: 3,
                child: SizedBox(
                  width: 150,
                  child: Slider(
                    value: _currentZoom.clamp(3.0, 12.0),
                    min: 3.0,
                    max: 12.0,
                    onChanged: (val) => setState(() => _currentZoom = val),
                    onChangeEnd: (val) =>
                        _mapController.move(_mapController.camera.center, val),
                  ),
                ),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: 16,
            // This keeps the button pinned just above the panel's top edge
            bottom: _isPanelExpanded ? 360 : 10,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.redAccent,
              onPressed: () {
                // This removes the TravelMapScreen from the stack
                // and returns the user to whatever was underneath it.
                Navigator.pop(context);
              },
              child: const Icon(Icons.close, color: Colors.white),
            ),
          ),

          // SLIDING PANEL
          // SLIDING PANEL
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: 0,
            right: 0,
            bottom: _isPanelExpanded ? 0 : -290,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () =>
                        setState(() => _isPanelExpanded = !_isPanelExpanded),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1B5E20),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.map, color: Colors.white, size: 24),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _selectedCountryName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _isPanelExpanded
                                ? Row(
                                    key: const ValueKey('expanded_buttons'),
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.location_pin,
                                          color: _viewMode == 'Landmarks'
                                              ? Colors.white
                                              : Colors.white60,
                                        ),
                                        onPressed: () => setState(
                                            () => _viewMode = 'Landmarks'),
                                        constraints: const BoxConstraints(),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.local_airport,
                                          color: _viewMode == 'Airports'
                                              ? Colors.white
                                              : Colors.white60,
                                        ),
                                        onPressed: () => setState(
                                            () => _viewMode = 'Airports'),
                                        constraints: const BoxConstraints(),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.directions_car,
                                          color: _viewMode == 'Transport'
                                              ? Colors.white
                                              : Colors.white60,
                                        ),
                                        onPressed: () => setState(
                                            () => _viewMode = 'Transport'),
                                        constraints: const BoxConstraints(),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                      ),
                                    ],
                                  )
                                : IconButton(
                                    key: const ValueKey('collapsed_menu_button'),
                                    icon: const Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => setState(
                                        () => _isPanelExpanded = true),
                                    constraints: const BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: _viewMode == 'Transport'
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Builder(
                              builder: (context) {
                                final allOptions = [
                                  ...((countryData[_selectedCountryName]!['landmarks']
                                              as List<dynamic>?) ??
                                          [])
                                      .map((i) => i['name'] as String),
                                  ...((countryAirportsData[_selectedCountryName]?['International']
                                              as List<dynamic>?) ??
                                          [])
                                      .map((i) => i['name'] as String),
                                  ...((countryAirportsData[_selectedCountryName]?['Local']
                                              as List<dynamic>?) ??
                                          [])
                                      .map((i) => i['name'] as String),
                                ];

                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      DropdownButtonFormField<String>(
                                        isExpanded: true,
                                        decoration: const InputDecoration(
                                          labelText: "Select Origin",
                                        ),
                                        value: _origin,
                                        items: allOptions.map((name) {
                                          final isLandmark =
                                              (countryData[_selectedCountryName]!['landmarks']
                                                      as List<dynamic>)
                                                  .any(
                                                    (item) =>
                                                        item['name'] == name,
                                                  );

                                          return DropdownMenuItem<String>(
                                            value: name,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  isLandmark
                                                      ? Icons.location_pin
                                                      : Icons.local_airport,
                                                  size: 18,
                                                  color: const Color(
                                                    0xFF1B5E20,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (val) =>
                                            setState(() => _origin = val),
                                      ),
                                      DropdownButtonFormField<String>(
                                        isExpanded: true,
                                        decoration: const InputDecoration(
                                          labelText: "Select Destination",
                                        ),
                                        value: _destination,
                                        items: allOptions.map((name) {
                                          final isLandmark =
                                              (countryData[_selectedCountryName]!['landmarks']
                                                      as List<dynamic>)
                                                  .any(
                                                    (item) =>
                                                        item['name'] == name,
                                                  );

                                          return DropdownMenuItem<String>(
                                            value: name,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  isLandmark
                                                      ? Icons.location_pin
                                                      : Icons.local_airport,
                                                  size: 18,
                                                  color: const Color(
                                                    0xFF1B5E20,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (val) =>
                                            setState(() => _destination = val),
                                      ),
                                      const SizedBox(height: 20),
                                      if (_routePoints.length == 2) ...[
                                        Card(
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.directions_car,
                                              color: Color(0xFF1B5E20),
                                            ),
                                            title: const Text(
                                              "Travel Estimate",
                                            ),
                                            subtitle: Text(
                                              "Distance: ${const Distance().as(LengthUnit.Kilometer, _routePoints[0], _routePoints[1]).toStringAsFixed(1)} km\n"
                                              "Est. Time: ${(_routePoints.isNotEmpty ? (const Distance().as(LengthUnit.Kilometer, _routePoints[0], _routePoints[1]) / 60).toStringAsFixed(0) : "0")} hours",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(0xFF1B5E20),
                                              ),
                                              onPressed: () {
                                                if (_origin == null || _destination == null) return;

                                                final start = _getCoords(_origin!);
                                                final end = _getCoords(_destination!);

                                                if (start != null && end != null) {
                                                  setState(() => _routePoints = [start, end]);
                                                  _mapController.fitCamera(
                                                    CameraFit.bounds(
                                                      bounds: LatLngBounds.fromPoints(_routePoints),
                                                      padding: const EdgeInsets.all(80.0),
                                                    ),
                                                  );
                                                }
                                              },
                                              child: const Text(
                                                "Track",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: const Color(0xFF1B5E20),
                                                side: const BorderSide(color: Color(0xFF1B5E20)),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _origin = null;
                                                  _destination = null;
                                                  _routePoints = [];
                                                });
                                              },
                                              child: const Text("Clear"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : ListView.builder(
                            controller: _listScrollController,
                            itemCount: currentList.length,
                            itemBuilder: (ctx, i) {
                              final item = currentList[i];
                              final bool isSelected = _highlightedIndex == i;
                              return Card(
                                color: isSelected ? Colors.green[100] : Colors.white,
                                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: ExpansionTile(
                                  controller: _tileControllers[i],
                                  title: GestureDetector(
                                    onTap: () {
                                      _mapController.move(LatLng(item['lat'], item['lng']), 12.0);
                                      _tileControllers[i].expand();
                                      setState(() {
                                        _highlightedIndex = i;
                                        _isPanelExpanded = true;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          _viewMode == 'Landmarks' ? Icons.location_pin : Icons.local_airport,
                                          color: isSelected ? Colors.green[900] : Colors.green[800],
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            item['name'],
                                            style: TextStyle(
                                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                              color: isSelected ? Colors.green[900] : Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    if (_viewMode == 'Landmarks' && item.containsKey('images'))
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                          ),
                                          itemCount: (item['images'] as List).length,
                                          itemBuilder: (context, imgIndex) {
                                            final imgPath = item['images'][imgIndex];
                                            return GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (_) => Dialog(
                                                    child: Image.asset(imgPath, fit: BoxFit.contain),
                                                  ),
                                                );
                                              },
                                              child: Image.asset(imgPath, fit: BoxFit.cover),
                                            );
                                          },
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _viewMode == 'Landmarks' ? item['desc'] : item['description'],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
