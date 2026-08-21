import 'package:flutter/material.dart';
import 'dataHandler/country_details.dart';
import 'models/travel_models.dart';
import 'widgets/landmark_panel.dart'; // Ensure this path matches your file structure

class TravelMapScreen extends StatefulWidget {
  const TravelMapScreen({super.key});

  @override
  State<TravelMapScreen> createState() => _TravelMapScreenState();
}

class _TravelMapScreenState extends State<TravelMapScreen> {
  /// Default country (SEA should be first in list)
  Country selectedCountry = southeastAsianCountries.first;

  /// Map to track bookmarks for the current session
  final Map<String, bool> _bookmarkedLandmarks = {};

  /// Tracks whether the panel is expanded or minimized
  bool _isPanelExpanded = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    // Define heights
    const double bannerHeight = 60.0;
    final double expandedHeight = screenSize.height * 0.30; // 30% of screen height
    
    // AnimatedPositioned needs to know where the panel is relative to the bottom edge
    // When minimized, only the banner is visible, so it's shifted down by the expanded content height.
    final double panelPosition = _isPanelExpanded ? 0 : -(expandedHeight - bannerHeight);

    return Scaffold(
      body: Stack(
        children: [
          /// 🌏 INTERACTIVE MAP (Background)
          SizedBox.expand(
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 3,
              child: Image.asset(
                'images/maps/${selectedCountry.mapImage}',
                fit: BoxFit.cover,
                width: screenSize.width,
                height: screenSize.height,
              ),
            ),
          ),

          /// 🔎 SEARCH BAR (Top)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Autocomplete<Country>(
                optionsBuilder: (value) {
                  if (value.text.isEmpty) return southeastAsianCountries;
                  return southeastAsianCountries.where((c) =>
                      c.name.toLowerCase().contains(value.text.toLowerCase()));
                },
                displayStringForOption: (c) => c.name,
                onSelected: (country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
                fieldViewBuilder: (context, controller, focusNode, _) {
                  return Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        hintText: "Search SEA country...",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          /// 🏛️ LANDMARK DISPLAY PANEL (Animated & Minimizable)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: panelPosition, // Controlled by minimization state
            child: Container(
              height: expandedHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, -2),
                  )
                ],
              ),
              child: Column(
                children: [
                  /// 🟢 STYLIZED GREEN BANNER (Minimizer Control)
                  GestureDetector(
                    // Allow tapping anywhere on the banner to toggle state
                    onTap: () {
                      setState(() {
                        _isPanelExpanded = !_isPanelExpanded;
                      });
                    },
                    child: Container(
                      height: bannerHeight,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1B5E20), // Dark Green
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.terrain, color: Colors.white, size: 28),
                              SizedBox(width: 12),
                              Text(
                                "LANDMARKS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          // Minimized/Expanded Arrow Icon
                          Icon(
                            _isPanelExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// 📜 SCROLLABLE LANDMARK CONTENT
                  // LandmarkPanel is scrollable by default due to its ListView
                  Expanded(
                    child: LandmarkPanel(
                      landmarks: selectedCountry.landmarks,
                      bookmarkedLandmarks: _bookmarkedLandmarks,
                      onBookmarkToggle: (landmarkName) {
                        setState(() {
                          _bookmarkedLandmarks[landmarkName] =
                              !(_bookmarkedLandmarks[landmarkName] ?? false);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ❌ CLOSE BUTTON (Floating above the panel)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            // Button must float above the visible portion of the panel
            bottom: _isPanelExpanded ? expandedHeight + 15 : bannerHeight + 15,
            right: 20,
            child: FloatingActionButton(
              mini: true,
              heroTag: "back_to_menu",
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}