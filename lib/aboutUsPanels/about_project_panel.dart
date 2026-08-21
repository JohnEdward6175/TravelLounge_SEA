import 'package:flutter/material.dart';
import 'package:my_app/referenceData/aboutProject.dart';

class AboutProjectPanel extends StatelessWidget {
  const AboutProjectPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // Parsing the key features string into a list for the card layout
    List<String> featureList = aboutProjectData["Key Features"]!
        .split('\n')
        .map((e) => e.replaceFirst('• ', '').trim())
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Mission Section - Occupies entire row
          _buildFullWidthSection(
            title: "Mission",
            content: aboutProjectData["Project Mission"]!,
            icon: Icons.rocket_launch,
            color: Colors.blueAccent,
          ),
          
          const SizedBox(height: 24),

          // 2. Key Features Section - Card List
          const Text(
            "Key Features",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...featureList.map((feature) => Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                  title: Text(
                    feature,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )),

          const SizedBox(height: 24),

          // 3. Goal Section - Occupies entire row
          _buildFullWidthSection(
            title: "Our Goal",
            content: aboutProjectData["Our Goal"]!,
            icon: Icons.flag,
            color: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildFullWidthSection({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: double.infinity, // Ensures it occupies the entire row
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color.withOpacity(0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}