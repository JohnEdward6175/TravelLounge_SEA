import 'package:flutter/material.dart';
import 'package:my_app/referenceData/proponents.dart'; // Ensure this matches your file path
import 'package:my_app/models/travel_models.dart'; //

class ProponentsPanel extends StatefulWidget {
  const ProponentsPanel({super.key});

  @override
  State<ProponentsPanel> createState() => _ProponentsPanelState();
}

class _ProponentsPanelState extends State<ProponentsPanel> {
  final PageController _pageController = PageController(viewportFraction: 0.85, initialPage: 1000);

  @override
  Widget build(BuildContext context) {
    // Get the list of Proponent objects instead of just strings
    final List<Proponent> proponents = proponentsData.values.toList();

    return SizedBox(
      height: 450,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final proponent = proponents[index % proponents.length];
          
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      // Purple Banner with Actual Image
                      Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.purple,
                        child: Center(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            // Load the image from the proponent object
                            backgroundImage: AssetImage(proponent.imagePath),
                          ),
                        ),
                      ),
                      // Proponent Name
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          proponent.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      // Participation Text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          proponent.participation,
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}