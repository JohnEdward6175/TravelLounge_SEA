import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/provider/chat_provider.dart';
import 'dashboard.dart';
import 'package:flutter/foundation.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/dataHandler/diary_data.dart';
import 'package:my_app/dataHandler/user_model.dart';
// import 'package:my_app/dataHandler/travel_requirements.dart'; 

import 'dataHandler/document_data.dart';
import 'package:my_app/features/currency_converter.dart';
import 'dataHandler/bag_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(DiaryEntryAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(UserProfileAdapter());
  }
  if (!Hive.isAdapterRegistered(5)) Hive.registerAdapter(DocumentItemAdapter());
  if (!Hive.isAdapterRegistered(6)) Hive.registerAdapter(DocumentListAdapter());

  if (!Hive.isAdapterRegistered(11)) Hive.registerAdapter(ShoppingItemAdapter());
  if (!Hive.isAdapterRegistered(10)) Hive.registerAdapter(ShoppingListAdapter());

  if (!Hive.isAdapterRegistered(7)) Hive.registerAdapter(BagItemAdapter());
  if (!Hive.isAdapterRegistered(8)) Hive.registerAdapter(BagCategoryAdapter());

  if (!Hive.isBoxOpen('entries')) {
    await Hive.openBox<DiaryEntry>('entries');
  }
  if (!Hive.isBoxOpen('userBox')) {
    await Hive.openBox<UserProfile>('userBox');
  }
    await Hive.openBox<DocumentList>('myDocuments');
  if (!kIsWeb) {
    // 
  }

  await Hive.openBox<BagCategory>('myBags');
  await Hive.openBox<DiaryEntry>('entries');
  await Hive.openBox<DocumentList>('myDocuments');
  await Hive.openBox<ShoppingList>('shopping_lists');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/loginSpace.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.airplanemode_active, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "TravelLounge:\nSEA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your ultimate companion for exploring\nSoutheast Asia safely and stylishly.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B1FA2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Dashboard()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("EXPLORE NOW", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_rounded),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}