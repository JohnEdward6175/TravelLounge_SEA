import 'package:flutter/material.dart';
import 'package:my_app/models/help_models.dart';

class HelpTravelPage extends StatelessWidget {
  const HelpTravelPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Travel Help")),
      body: const Center(child: Text("Your Travel help content here")),
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

final List<HelpItem> helpTravelData = [
  HelpItem(
    title: 'Banner',
    icon: Icons.search,
    description: 'This banner will display a search bar allowing users to select countries within Southeast Asia.',
  ),
  HelpItem(
    title: 'Temperature Tracking',
    icon: Icons.thermostat,
    description: 'This container displays the selected country\'s temperature (in Celsius), condition (sunny, cloudy, rainy, etc.), and humidity.',
  ),
  HelpItem(
    title: 'About the Country',
    icon: Icons.info_outline,
    description: 'Displays a brief description about the selected country.',
  ),
  HelpItem(
    title: 'Airports',
    icon: Icons.flight_takeoff,
    description: 'Displays the major international and local airports of the selected country along with a brief description for each.',
  ),
  HelpItem(
    title: 'Country Rules',
    icon: Icons.gavel,
    description: 'Displays rules that need to be followed for each country for a safe and orderly travel.',
  ),
  HelpItem(
    title: 'Local Dishes',
    icon: Icons.restaurant_menu,
    description: 'Displays top 10 must-try dishes for each country along with:\n'
        '• Dish Name and Place of Origin\n'
        '• Short description\n'
        '• Brief History\n'
        '• Image of the Dish',
  ),
  HelpItem(
    title: 'View Landmarks',
    icon: Icons.camera_alt,
    description: 'Displays top 10 must-visit landmarks for each country along with:\n'
        '• Landmark Name\n'
        '• Brief Description\n'
        '• Landmark Image',
  ),
  HelpItem(
    title: 'Travel Requirements',
    icon: Icons.assignment_turned_in,
    description: 'Redirects users to the Requirements Section of the application.',
  ),
  HelpItem(
    title: 'MainMap',
    icon: Icons.map,
    description: 'Displays a live map with the following:\n'
        '• Search Bar: Redirects user to different countries within Southeast Asia.\n'
        '• Live Map: Displays world map.\n'
        '• Landmark Tags: Displays interactable pins for landmarks allowing users to view the location\'s details.\n'
        '• Airport Tags: Displays interactable pins for local and international airports allowing users to view the airport\'s details.\n'
        '• Location Track: Allows users to select two locations and the app will display the estimated distance and time that will be spent when traveling in between.',
  ),
];