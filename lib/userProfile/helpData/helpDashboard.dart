import 'package:flutter/material.dart';
import 'package:my_app/models/help_models.dart';

class HelpDashboardPage extends StatelessWidget {
  const HelpDashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard Help")),
      body: const Center(child: Text("Your dashboard help content here")),
    );
  }
}

// Standardized class name for HelpScreen compatibility
// class HelpItem {
//   final String title;
//   final String description;
//   final IconData icon;

//   HelpItem({
//     required this.title, 
//     required this.description, 
//     required this.icon
//   });
// }

final List<HelpItem> helpDashboardData = [
  HelpItem(
    title: 'Banner',
    icon: Icons.badge,
    description: 'This banner will display the:\n'
        '• User\'s name which can be updated in the profile section.\n'
        '• Live time displayed in "standard time" or 12-hour clock format.',
  ),
  HelpItem(
    title: 'Date Today',
    icon: Icons.calendar_month,
    description: 'Displays the day, month, and year in little-endian format (DD/MM/YYYY).',
  ),
  HelpItem(
    title: 'Quick Actions',
    icon: Icons.flash_on,
    description: 'Will display buttons that can guide and redirect users to other screens of the application.',
  ),
  HelpItem(
    title: 'Ads Section',
    icon: Icons.ad_units,
    description: 'Displays ads that can help the developers to gain profit from the app without overloading the users with pop-up ads.',
  ),
];