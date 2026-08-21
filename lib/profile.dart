import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../dataHandler/user_model.dart';
import 'main.dart';
import 'userProfile/accountSettings.dart';
import 'userProfile/help.dart';
import 'userProfile/about_us.dart';
import 'userProfile/references.dart';

import 'package:my_app/globals.dart' as globals;
import 'package:flutter/foundation.dart' show kIsWeb;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double _expandedHeight = 280;
  static const Color brandYellow = Color(0xFFF3DC0D);

  Box<UserProfile> get _userBox => Hive.box<UserProfile>('userBox');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _userBox.listenable(),
      builder: (context, Box<UserProfile> box, _) {
        final user = box.get('profile');

        // Syncing Username (Large) and Full Name (Small)
        final String username = user?.username ?? 'Traveler';
        final String displayName = user?.fullName ?? 'Alex Johnson';

        final String? imagePath = user?.photoPath;

        return Scaffold(

floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

floatingActionButton: globals.isFromChat 
  ? Padding(
      padding: const EdgeInsets.only(top: 30.0), // Moves it down from the very top edge
      child: FloatingActionButton(
        // Set to false or remove 'mini' to make it standard (bigger) size
        mini: false, 
        // This shape makes it a perfect circle
        shape: const CircleBorder(), 
        backgroundColor: Colors.yellow, 
        foregroundColor: Colors.white, 
        onPressed: () {
          globals.isFromChat = false; 
          Navigator.pop(context); 
        },
        child: const Icon(Icons.chat, size: 28), // Increased icon size
      ),
    )
  : null,

          backgroundColor: Colors.grey.shade50,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: _expandedHeight,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/loginSpace.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 48),
                          CircleAvatar(
  key: ValueKey(imagePath), // Keeps it refreshed
  radius: 48,
  backgroundColor: Colors.white,
  // Load the image if the path exists, otherwise null
  backgroundImage: (imagePath != null && imagePath.isNotEmpty)
      ? (kIsWeb ? NetworkImage(imagePath!) : FileImage(File(imagePath!)))
      : null,
  // Show the icon only if there is no image
  child: (imagePath == null || imagePath.isEmpty)
      ? const Icon(
          Icons.person,
          size: 48,
          color: brandYellow,
        )
      : null,
),
                          const SizedBox(height: 16),
                          // Larger Text: Username
                          Text(
                            username,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Smaller Text: Full Name
                          Text(
                            displayName,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // --- Remainder of the UI (Stats, Options, Footer) ---
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 24,
              //       vertical: 16,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         _buildStat('24', 'Checklists'),
              //         _buildStat('56', 'Diary Entries'),
              //         _buildStat('11', 'My Bag'),
              //       ],
              //     ),
              //   ),
              // ),
              // ... (inside build method's SliverList)
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildOptionTile(
                      context,
                      title: 'Customize Profile',
                      icon: Icons.settings,
                      color: Colors.purple,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AccountSettingsScreen(),
                        ),
                      ),
                    ),
                    _buildOptionTile(
                      context,
                      title: 'Help & Support',
                      icon: Icons.help_outline,
                      color: Colors.blueAccent,
                      // Updated to use the HelpScreen
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HelpScreen()),
                      ),
                    ),
                    _buildOptionTile(
                      context,
                      title: 'Logout',
                      icon: Icons.logout,
                      color: Colors.grey,
                      onTap: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const MyApp()),
                        (route) => false,
                      ),
                    ),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ReferencesScreen(),
                          ),
                        ),
                        child: const Text(
                          'References',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('|', style: TextStyle(color: Colors.grey)),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AboutUsScreen(),
                          ),
                        ),
                        child: const Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Text(title, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
