import 'package:flutter/material.dart';

import 'package:my_app/referenceData/technologies.dart';

class TechnologiesPanel extends StatelessWidget {
  const TechnologiesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Software",
        "data": technologiesData["Software"]!,
        "icon": Icons.developer_mode_rounded,
        "color": Colors.teal,
      },
      {
        "title": "Hardware",
        "data": technologiesData["Hardware"]!,
        "icon": Icons.important_devices_rounded,
        "color": Colors.cyan.shade700,
      },
    ];

    return SizedBox(
      height: 480, // Slightly taller to accommodate the software list
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: categories.length,
        padEnds: false,
        itemBuilder: (context, index) {
          final item = categories[index];
          return _buildTechCard(
            item["title"] as String,
            item["data"] as String,
            item["icon"] as IconData,
            item["color"] as Color,
          );
        },
      ),
    );
  }

  Widget _buildTechCard(String title, String content, IconData icon, Color color) {
    // Splits by numbers (1., 2., etc.)
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
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sections.length,
              separatorBuilder: (context, index) => const Divider(height: 32, thickness: 0.5),
              itemBuilder: (context, index) {
                String text = sections[index].trim();
                if (text.isEmpty) return const SizedBox.shrink();

                List<String> lines = text.split('\n');
                String techTitle = lines[0];
                String techDescription = lines.skip(1).join('\n');

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.settings_input_component_rounded, 
                             size: 14, color: color.withOpacity(0.7)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            techTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                        techDescription,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: Colors.grey.shade700,
                        ),
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