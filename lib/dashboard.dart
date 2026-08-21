import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import '../dataHandler/user_model.dart'; // Adjust this path to your user_model
import 'diary.dart';
import 'features/travel_menu_screen.dart';
import 'profile.dart';
import 'features.dart';

import 'globals.dart' as globals;

import 'package:audioplayers/audioplayers.dart';
import 'ads/ad_card_widget.dart';

void playClick() {
  AudioPlayer().play(AssetSource('sounds/click.mp3'));
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  late Timer _timer;
  DateTime _now = DateTime.now();

  final PageController _pageController = PageController();

  final List<Color> _navColors = [
    Colors.purple, // Home
    Colors.red, // Diary
    Colors.green, // Travel
    Colors.yellow, // Features
    Colors.purple, // Profile
  ];

  Box<UserProfile> get _userBox => Hive.box<UserProfile>('userBox');

  @override
  void dispose() {
    // This cleans up the memory when the screen closes

    _timer.cancel(); // Don't forget your timer too!
    super.dispose();
  }

  String _getGreeting() {
    int hour = _now.hour;
    if (hour < 12) return "Good Morning";
    if (hour < 17) return "Good Afternoon";
    return "Good Evening";
  }

  String _formatTime() {
    int hour = _now.hour;
    int minute = _now.minute;
    String period = hour >= 12 ? "PM" : "AM";
    hour = hour % 12 == 0 ? 12 : hour % 12;
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
  }

  final List<Map<String, dynamic>> quickActions = [
    {
      'icon': Icons.book,
      'label': 'Diary',
      'color': Colors.red,
      'screen': 'diary',
    },
    {
      'icon': Icons.flight,
      'label': 'Travel',
      'color': Colors.green,
      'screen': 'travel',
    },
    {
      'icon': Icons.star,
      'label': 'Features',
      'color': Colors.yellow,
      'screen': 'feature',
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
      'color': Colors.purple,
      'screen': 'profile',
    },
  ];

  int _getIndex(String screen) {
    switch (screen) {
      case 'diary':
        return 1;
      case 'travel':
        return 2;
      case 'feature':
        return 3;
      case 'profile':
        return 4;
      default:
        return 0;
    }
  }

  Color _getNavbarColor(int index) => index == 2
      ? Colors.green.withOpacity(0.8)
      : Colors.purple.withOpacity(0.8);

  Widget _buildHomeScreen() {
    return ValueListenableBuilder(
      valueListenable: _userBox.listenable(),
      builder: (context, Box<UserProfile> box, _) {
        final user = box.get('profile');
        final String displayName = user?.fullName ?? 'Alex Johnson';

        return SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.indigo],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getGreeting(),
                              style: const TextStyle(
                                color: Color(0xFFE1BEE7),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              displayName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              width: 44,
                              height: 44,
                              color: Colors.white.withOpacity(0.2),
                              child: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _formatTime(),
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Date Overview
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Date Today", style: TextStyle(fontSize: 16)),
                          Icon(
                            Icons.calendar_today,
                            color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                _now.day.toString().padLeft(2, '0'),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("Day"),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey.shade300,
                          ),
                          Column(
                            children: [
                              Text(
                                _now.month.toString().padLeft(2, '0'),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("Month"),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey.shade300,
                          ),
                          Column(
                            children: [
                              Text(
                                _now.year.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("Year"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Quick Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: quickActions
                          .map(
                            (action) => InkWell(
                              onTap: () {
                                int newIndex = _getIndex(
                                  action['screen'],
                                ); // Determine the target index [cite: 14, 15, 16, 17, 18]

                                setState(() {
                                  _currentIndex =
                                      newIndex; // Update the UI state to highlight the correct nav item [cite: 66]
                                });

                                // Explicitly command the PageView to move to the new screen [cite: 93, 94]
                                _pageController.animateToPage(
                                  newIndex,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: action['color'],
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  action['icon'],
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),

              // Sponsored Ad
              AdCardWidget(),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return DiaryScreen();
      case 2:
        return TravelMenuScreen();
      case 3:
        return FeaturesScreen();
      case 4:
        return ProfileScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

      floatingActionButton: globals.isFromChat
          ? Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ), // Moves it down from the very top edge
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
      bottomNavigationBar: ClipRRect(
        borderRadius: _currentIndex == 2
            ? BorderRadius.zero
            : const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: _navColors[_currentIndex].withOpacity(0.8),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                playClick();
                setState(() => _currentIndex = index);
                // This animates the slide transition for you automatically
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.book), label: "Diary"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.flight),
                  label: "Travel",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: "Features",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),

      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // Keeps control in the bottom navbar
        children: [
          _buildHomeScreen(),
          DiaryScreen(),
          TravelMenuScreen(),
          FeaturesScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
