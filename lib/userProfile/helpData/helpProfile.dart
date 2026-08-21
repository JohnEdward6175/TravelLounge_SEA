import 'package:flutter/material.dart';

class HelpProfilePage extends StatelessWidget {
  const HelpProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Help")),
      body: const Center(child: Text("Your profile help content here")),
    );
  }
}

class SubDropdown {
  final String title;
  final String description;
  final IconData icon;

  SubDropdown({required this.title, required this.description, required this.icon});
}

class HelpProfileItem {
  final String title;
  final String description;
  final IconData icon;
  final List<SubDropdown> subDropdowns;

  HelpProfileItem({
    required this.title,
    required this.description,
    required this.icon,
    this.subDropdowns = const [],
  });
}

final List<HelpProfileItem> helpProfileData = [
  HelpProfileItem(title: 'Banner', description: 'This banner will display the user\'s User name and full name.', icon: Icons.person_outline),
  HelpProfileItem(title: 'Customize Profile', description: 'Allows users to update their full name, username, and email which will be displayed in other screens.', icon: Icons.edit),
  HelpProfileItem(title: 'Help & Support', description: 'Provide guides for the users and serves as the application\'s contents summary.', icon: Icons.help_outline),
  HelpProfileItem(title: 'Log out', description: 'Brings the user back to the welcome screen.', icon: Icons.logout),
  HelpProfileItem(title: 'References', description: 'Displays the related literatures, technologies, and references that the developers used to create the application.', icon: Icons.library_books),
  HelpProfileItem(title: 'About Us', description: 'Displays the project context, introduces the proponents/developers, and the references used.', icon: Icons.info_outline),
];