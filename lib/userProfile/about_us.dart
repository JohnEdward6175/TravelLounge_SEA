import 'package:flutter/material.dart';

import 'package:my_app/aboutUsPanels/about_project_panel.dart';
import 'package:my_app/aboutUsPanels/proponents_panel.dart';
import 'package:my_app/aboutUsPanels/reference_link_panel.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220, // Slightly taller for a more open feel
            pinned: true,
            backgroundColor: Colors.purple,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                "About Us",
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'images/loginSpace.png',
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black.withOpacity(0.3)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              // Reduced horizontal padding to allow cards to be wider
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
              child: Column(
                children: [
                  // 1. Project Context Dropdown
                  _buildDropdownCard(
                    title: "Project Context",
                    subtitle: "Background and Objectives",
                    icon: Icons.auto_awesome,
                    iconColor: Colors.orange,
                    panel: const AboutProjectPanel(),
                  ),
                  const SizedBox(height: 20), // Increased spacing between cards

                  // 2. Proponents Dropdown
                  _buildDropdownCard(
                    title: "Project Proponents",
                    subtitle: "The Development Team",
                    icon: Icons.groups_rounded,
                    iconColor: Colors.blue,
                    panel: const ProponentsPanel(),
                  ),
                  const SizedBox(height: 20),

                  // 3. Reference Links Dropdown
                  _buildDropdownCard(
                    title: "References",
                    subtitle: "Resources and Credits",
                    icon: Icons.link,
                    iconColor: Colors.green,
                    panel: const ReferenceLinkPanel(),
                  ),
                  // Extra bottom padding to ensure content isn't cut off
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownCard({
    required String title,
    required String subtitle,
    required Widget panel,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity, // Forces card to occupy full available width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // More rounded corners for a modern look
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), 
            blurRadius: 12, 
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          // Increased tile padding for a wider, less cramped header
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          leading: CircleAvatar(
            radius: 25, // Larger icon area
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          childrenPadding: EdgeInsets.zero,
          expandedAlignment: Alignment.topLeft,
          children: [
            const Divider(thickness: 1, indent: 20, endIndent: 20),
            // The panel is wrapped in a SizedBox to ensure it uses the card's full width
            SizedBox(
              width: double.infinity,
              child: panel,
            ),
            const SizedBox(height: 12), // Padding at the bottom of the expanded area
          ],
        ),
      ),
    );
  }
}