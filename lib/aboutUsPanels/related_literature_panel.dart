import 'package:flutter/material.dart';

import 'package:my_app/referenceData/related.dart';

class RelatedLiteraturePanel extends StatelessWidget {
  const RelatedLiteraturePanel({super.key});

  // lib/aboutUsPanels/related_literature_panel.dart

  @override
  Widget build(BuildContext context) {
    // 1. Helper function to turn your Map into a numbered string format
    String formatMapData(Map<String, String> map) {
      int index = 1;
      return map.entries
          .map((e) => "${index++}. ${e.key}\n${e.value}")
          .join("\n\n");
    }

    // 2. Map your specific files to the categories the UI expects
    final categories = [
      {
        "title": "Related Theories",
        "data": formatMapData(relatedData), // Pulls from relatedData map
        "icon": Icons.psychology_outlined,
        "color": Colors.purple,
      },
      {
        "title": "Related Projects",
        "data": formatMapData(
          relatedProjectsData,
        ), // Pulls from relatedProjectsData map
        "icon": Icons.tips_and_updates_outlined,
        "color": Colors.blueAccent,
      },
    ];

    return SizedBox(
      height: 450,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: categories.length,
        padEnds: false,
        itemBuilder: (context, index) {
          final item = categories[index];
          return _buildLiteratureCard(
            item["title"] as String,
            item["data"] as String,
            item["icon"] as IconData,
            item["color"] as Color,
          );
        },
      ),
    );
  }

  Widget _buildLiteratureCard(
    String title,
    String content,
    IconData icon,
    Color color,
  ) {
    // Splitting the content by number "1. ", "2. ", etc. to style headers differently
    // This regex looks for a digit followed by a dot at the start of a line
    List<String> sections = content.split(RegExp(r'(?=\d\.)'));

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 8, bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section for the Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: color),
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
          ),

          // Content section
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sections.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                String text = sections[index].trim();
                if (text.isEmpty) return const SizedBox.shrink();

                // Separate the number + title from the description
                List<String> lines = text.split('\n');
                String itemTitle = lines[0];
                String itemDescription = lines.skip(1).join('\n');

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      itemDescription,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
