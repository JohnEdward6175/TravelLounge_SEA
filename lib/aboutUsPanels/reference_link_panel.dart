import 'package:flutter/material.dart';
import 'package:my_app/referenceData/referenceLink.dart';
import 'dish_reference.dart';
import 'landmarks_reference.dart';

class ReferenceLinkPanel extends StatelessWidget {
  const ReferenceLinkPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. General Resources - Full Row DisplayF
          _buildFullWidthSection(
            title: "General Resources",
            content: referenceLinkData["General Resources"]!,
            icon: Icons.library_books_outlined,
            color: Colors.blueGrey,
          ),

          const SizedBox(height: 24),

          // 2. Tourism & Landmarks - Card List
          const Text(
            "Landmarks References",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: landmarkReferenceData.keys.length,
              itemBuilder: (context, countryIndex) {
                String country = landmarkReferenceData.keys.elementAt(countryIndex);
                var landmarks = landmarkReferenceData[country]!;

                return SizedBox(
                  width: 280,
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            country,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          Expanded(
                            child: ListView.separated(
                              itemCount: landmarks.length,
                              separatorBuilder: (ctx, i) => const Divider(height: 20),
                              itemBuilder: (context, landmarkIndex) {
                                final landmark = landmarks[landmarkIndex];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.bookmark, size: 14, color: Colors.deepPurple),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            landmark["name"]!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        landmark["url"]!,
                                        style: const TextStyle(fontSize: 11, color: Colors.blue),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      
          const SizedBox(height: 24),

          // 3. Culinary & Culture - Country Cards
          const Text(
            "Local Dishes References",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dishReferenceData.keys.length,
              itemBuilder: (context, countryIndex) {
                String country = dishReferenceData.keys.elementAt(countryIndex);
                var dishes = dishReferenceData[country]!;

                return SizedBox(
                  width: 280,
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            country,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          Expanded(
                            child: ListView.separated(
                              itemCount: dishes.length,
                              separatorBuilder: (ctx, i) =>
                                  const Divider(height: 20),
                              itemBuilder: (context, dishIndex) {
                                final dish = dishes[dishIndex];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // This creates your "floating dot"
                                        // Replace your Container code with this:
                                        const Icon(
                                          Icons
                                              .bookmark, // Change this to any icon you want
                                          size: 14,
                                          color: Colors.deepPurple,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ), // Space between dot and text
                                        // Dish Name
                                        Expanded(
                                          child: Text(
                                            dish["name"]!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    // Reference link text with slight indentation
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        dish["url"]!,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.blue,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // 4. Historical References - Full Row Display
          _buildFullWidthSection(
            title: "Historical References",
            content: referenceLinkData["Historical References"]!,
            icon: Icons.history_edu_outlined,
            color: Colors.brown,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper to build the individual cards for bulleted items
  List<Widget> _buildLinkCards(String data, IconData icon) {
    return data
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .map(
          (line) => Card(
            elevation: 1.5,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(icon, color: Colors.deepPurple.shade300),
              title: Text(
                line.replaceFirst('• ', '').trim(),
                style: const TextStyle(fontSize: 14),
              ),
              trailing: const Icon(
                Icons.open_in_new,
                size: 16,
                color: Colors.grey,
              ),
              onTap: () {
                // You can implement url_launcher here later
              },
            ),
          ),
        )
        .toList();
  }

  // Helper to build the full-width sections for general/historical text
  Widget _buildFullWidthSection({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 13,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
