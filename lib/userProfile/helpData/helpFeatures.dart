import 'package:flutter/material.dart';

class HelpFeaturesPage extends StatelessWidget {
  const HelpFeaturesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Features Help")),
      body: const Center(child: Text("Your features help content here")),
    );
  }
}

class SubDropdown {
  final String title;
  final String description;
  final IconData icon;

  SubDropdown({required this.title, required this.description, required this.icon});
}

class HelpFeaturesItem {
  final String title;
  final String description;
  final IconData icon;
  final List<SubDropdown> subDropdowns;

  HelpFeaturesItem({
    required this.title, 
    required this.description, 
    required this.icon,
    this.subDropdowns = const [],
  });
}

final List<HelpFeaturesItem> helpFeaturesData = [
  HelpFeaturesItem(
    title: 'Banner', 
    description: 'This banner will display a search bar allowing users to select countries within Southeast Asia.', 
    icon: Icons.search
  ),
  HelpFeaturesItem(
    title: 'Weather Forecast', 
    description: 'Displays weather and temperature based on your selected country.', 
    icon: Icons.wb_sunny
  ),
  HelpFeaturesItem(
    title: 'My Documents', 
    description: 'Redirects users to the Documents screen.', 
    icon: Icons.description,
    subDropdowns: [
      SubDropdown(title: 'Banner', description: 'Displays a search bar that filters the screen contents based on the selected country.', icon: Icons.search),
      SubDropdown(title: 'Filters: Documents and Requirements', description: 'Allows sorting between Documents (user-added lists, editable, with checkboxes) and Requirements (Mandatory items, suggested items, and exchange rates).', icon: Icons.filter_list),
      SubDropdown(title: 'Add Item List', description: 'Displays a prompt asking for the List name and country before creating the list.', icon: Icons.add_circle),
    ],
  ),
  HelpFeaturesItem(
    title: "What's in My Bag?",
    description: 'Redirects users to the My Bag screen.',
    icon: Icons.shopping_bag,
    subDropdowns: [
      SubDropdown(title: 'Banner', description: 'Displays a search bar that filters the screen contents based on the selected country.', icon: Icons.search),
      SubDropdown(title: 'Items', description: 'Displays item lists added by the users; each can be edited, deleted, and tracked via a checkbox.', icon: Icons.list),
      SubDropdown(title: 'Add Item List', description: 'Displays a prompt asking for the List name and country before creating the list.', icon: Icons.add_circle),
    ],
  ),
  HelpFeaturesItem(
    title: 'Budget Planner',
    description: 'Redirects users to the Budget Planner screen.',
    icon: Icons.account_balance_wallet,
    subDropdowns: [
      SubDropdown(title: 'Banner', description: 'Requires two prompts with numerical input and a Southeast Asian country currency unit selector.', icon: Icons.input),
      SubDropdown(title: 'Budget Plan', description: 'Displays item lists added by the users; each can be edited, deleted, and tracked via a checkbox.', icon: Icons.list),
      SubDropdown(title: 'Add Item List', description: 'Displays a prompt asking for the List name and country before creating the list.', icon: Icons.add_circle),
    ],
  ),
  HelpFeaturesItem(
    title: 'Ask Travel Assistant (ChatBot)',
    description: 'Redirects users to Askbot: allows users to ask about details related to the app, use tags as guides, and view conversation history.',
    icon: Icons.chat
  ),
];