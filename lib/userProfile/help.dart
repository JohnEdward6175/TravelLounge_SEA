import 'package:flutter/material.dart';
import 'package:my_app/userProfile/helpData/helpDashboard.dart';
import 'package:my_app/userProfile/helpData/helpDiary.dart';
import 'package:my_app/userProfile/helpData/helpTravel.dart';
import 'package:my_app/userProfile/helpData/helpFeatures.dart';
import 'package:my_app/userProfile/helpData/helpProfile.dart';

//Main dropdown beep beep
import 'package:my_app/dashboard.dart';
import 'package:my_app/diary.dart';
import 'package:my_app/features/travel_menu_screen.dart';
import 'package:my_app/features.dart';
import 'package:my_app/profile.dart';

//Features Dropdown
import 'package:my_app/features/documents.dart';
import 'package:my_app/features/myBag.dart';
import 'package:my_app/features/currency_converter.dart';
import 'package:my_app/chatCode/data/chatUI.dart';

//Profile
import 'package:my_app/userProfile/accountSettings.dart';
import 'package:my_app/userProfile/help.dart';
import 'package:my_app/userProfile/references.dart';
import 'package:my_app/userProfile/about_us.dart';

//map
import 'package:my_app/mapcode/main_map.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sections = [
      {'title': 'Dashboard', 'data': helpDashboardData, 'color': Colors.indigo},
      {'title': 'Diary', 'data': helpDiaryData, 'color': Colors.pink},
      {'title': 'Travel', 'data': helpTravelData, 'color': Colors.green},
      {'title': 'Features', 'data': helpFeaturesData, 'color': Colors.amber},
      {'title': 'Profile', 'data': helpProfileData, 'color': Colors.purple},
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: sections.length,
                itemBuilder: (context, index) =>
                    _buildSection(context, sections[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, Map<String, dynamic> section) {
    final Color sectionColor = section['color'];
    final List<dynamic> data = section['data'];

    // Define this at the top of your class or as a helper
    final List<String> itemsWithButtons = [
      'My Documents',
      "What's in My Bag?",
      'Budget Planner',
      'Ask Travel Assistant (Chatbot)',
      'Customize Profile',
      'Help & Support',
      'References',
      'About Us',
      'MainMap',
    ];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        leading: Icon(
          _getIconForSection(section['title']),
          color: sectionColor,
        ),
        title: Text(
          section['title'],
          style: TextStyle(fontWeight: FontWeight.bold, color: sectionColor),
        ),
        children: [
          ...data.map((item) {
            bool hasSub =
                item.runtimeType.toString() == 'HelpFeaturesItem' &&
                item.subDropdowns.isNotEmpty;

            // Inside your data.map loop:
            return ExpansionTile(
              leading: Icon(item.icon, color: sectionColor),
              title: Text(item.title),
              children: [
                // 1. Show description
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(item.description),
                ),

                // 2. Show sub-items (Features) with their descriptions
                if (hasSub)
                  ...item.subDropdowns.map(
                    (sub) => ListTile(
                      leading: Icon(
                        sub.icon,
                        size: 20,
                        color: sectionColor.withOpacity(0.6),
                      ),
                      title: Text(
                        sub.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ADD THIS LINE TO SHOW THE DESCRIPTION:
                      subtitle: Text(
                        sub.description,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),

                // 3. ONLY show the button if the title is in our 'itemsWithButtons' list
                if (itemsWithButtons.contains(item.title))
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: GestureDetector(
                      onTap: () => _handleNavigation(context, item.title),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: sectionColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.open_in_new,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Go to ${item.title} Screen",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }),

          // Updated button design
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: GestureDetector(
              onTap: () => _handleNavigation(context, section['title']),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: sectionColor, // Solid color
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                    ), // White icon
                    const SizedBox(width: 12),
                    Text(
                      "Go to ${section['title']} Screen",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ), // White text
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.white,
                    ), // White arrow
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleNavigation(BuildContext context, String title) {
    Widget? screen;

    // Combine all your cases here
    switch (title) {
      // --- Features ---
      case 'My Documents':
        screen = const DocumentsPage();
        break;
      case "What's in My Bag?":
        screen = const MyBagPage();
        break;
      case 'Budget Planner':
        screen = const CurrencyConverterScreen();
        break;
      case 'Ask Travel Assistant (Chatbot)':
        screen = const ChatBotScreen();
        break;

      // --- Profile ---
      case 'Customize Profile':
        screen = const AccountSettingsScreen();
        break;
      case 'Help & Support':
        screen = const HelpScreen();
        break;
      case 'References':
        screen = const ReferencesScreen();
        break;
      case 'About Us':
        screen = const AboutUsScreen();
        break;

      // --- Dashboard/Diary/Travel/Profile Sections ---
      case 'Dashboard':
        screen = const Dashboard();
        break;
      case 'Diary':
        screen = const DiaryScreen();
        break;
      case 'Travel':
        screen = const TravelMenuScreen();
        break;
      case 'Features':
        screen = const FeaturesScreen();
        break;
      case 'Profile':
        screen = const ProfileScreen();
        break;

      // MAP  TravelMapScreen
      case 'MainMap':
        screen = const TravelMapScreen();
        break;
    }

    if (screen != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.indigo]),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          const Text(
            'Help & Support',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForSection(String title) {
    switch (title) {
      case 'Dashboard':
        return Icons.dashboard;
      case 'Diary':
        return Icons.book;
      case 'Travel':
        return Icons.flight;
      case 'Features':
        return Icons.star;
      case 'Profile':
        return Icons.person;
      default:
        return Icons.help;
    }
  }
}
