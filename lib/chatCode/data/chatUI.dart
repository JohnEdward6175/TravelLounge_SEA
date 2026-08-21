import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_ai/flutter_local_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:my_app/chatCode/data/countries.dart';
import 'package:my_app/chatCode/data/landmarkDetails.dart';
import 'package:my_app/chatCode/data/dishes.dart';
import 'package:my_app/chatCode/data/rules.dart';
import 'package:my_app/chatCode/data/airports.dart';
import 'package:my_app/chatCode/data/travelRequirements.dart';
import 'package:my_app/models/help_models.dart';

import 'package:my_app/userProfile/helpData/helpDashboard.dart';
import 'package:my_app/userProfile/helpData/helpDiary.dart';
import 'package:my_app/userProfile/helpData/helpTravel.dart';
import 'package:my_app/userProfile/helpData/helpFeatures.dart';
import 'package:my_app/userProfile/helpData/helpProfile.dart';

import 'package:my_app/features/travel_menu_screen.dart';
import 'package:my_app/dashboard.dart';
import 'package:my_app/profile.dart';
import 'package:my_app/features.dart';
import 'package:my_app/diary.dart';

import 'package:collection/collection.dart';

import 'package:my_app/globals.dart' as globals;
// bool isFromChat = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(home: ChatBotScreen(), debugShowCheckedModeBanner: false),
  );
}

class TourSection {
  final List<dynamic> data;
  final Widget screen;
  TourSection({required this.data, required this.screen});
}

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});
  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FlutterLocalAi _ai = FlutterLocalAi();

  static const Color mainPurple = Color(0xFFF3DC0D);
  static const Color mainYellow = Color(0xFFF3DC0D);

  late final Map<String, TourSection> tourDataMap;

  // Paste this inside the _ChatBotScreenState class
  void triggerShortcutResponse(String userText, String botResponse) {
    setState(() {
      _messages.add({'text': userText, 'isUser': true});
      _messages.add({'text': botResponse, 'isUser': false});
    });

    _messageController.clear();
    _saveHistory();
    _scrollToBottom();
  }

  bool isMatch(String itemText, String userQuery) {
    final cleanItem = itemText.toLowerCase().trim();
    final cleanQuery = userQuery.toLowerCase().trim();
    // Only match if the user types at least 3 characters
    return cleanQuery.length >= 3 && cleanItem.contains(cleanQuery);
  }

  void _sendBotReply(String userText, String botReply) {
    setState(() {
      _messages.add({'text': userText, 'isUser': true});
      _messages.add({'text': botReply, 'isUser': false});
    });
    _messageController.clear();
    _saveHistory();
    _scrollToBottom();
  }

  String _formatHelpData(List<HelpItem> data) {
    return data
        .map((item) => "★ ${item.title}: ${item.description}")
        .join("\n\n");
  }

  String _formatSubDropdowns(List<dynamic> subDropdowns) {
    if (subDropdowns.isEmpty) return "";

    return "\n\nDetails:\n" +
        subDropdowns
            .map((sub) => "  ★ ${sub.title}: ${sub.description}")
            .join("\n");
  }

  String _formatDiaryHelp(List<HelpDiaryItem> data) {
    return data
        .map((item) => "★ ${item.title}:\n${item.description}")
        .join("\n\n");
  }

  String _formatFeaturesHelp(List<HelpFeaturesItem> data) {
    return data
        .map((item) {
          String text = "★ ${item.title}: ${item.description}";
          // If there are sub-dropdowns, format and add them
          if (item.subDropdowns.isNotEmpty) {
            String subText = item.subDropdowns
                .map((sub) => "    - ${sub.title}: ${sub.description}")
                .join("\n");
            text += "\n$subText";
          }
          return text;
        })
        .join("\n\n");
  }

  // Change the parameter type to dynamic to accept any list
  String _formatComplexHelp(List<dynamic> data) {
    return data
        .map((item) {
          String text = "★ ${item.title}: ${item.description}";

          // This will work for both Features and Profile items
          if (item.subDropdowns.isNotEmpty) {
            String subText = item.subDropdowns
                .map((sub) => "    - ${sub.title}: ${sub.description}")
                .join("\n");
            text += "\n$subText";
          }
          return text;
        })
        .join("\n\n");
  }

  String _formatHelpContent(List<dynamic> data) {
    // This generic function works for anything that has .title and .description
    return data
        .map((item) => "★ ${item.title}:\n${item.description}")
        .join("\n\n");
  }

  void _navigateToHelpSection(String section) {
    Widget targetPage;

    // Logic to map the tag to the specific Help file/page
    switch (section) {
      case 'Dashboard':
        targetPage = const HelpDashboardPage();
        break;
      case 'Diary':
        targetPage = const HelpDiaryPage();
        break;
      case 'Travel':
        targetPage = const HelpTravelPage();
        break;
      case 'Features':
        targetPage = const HelpFeaturesPage();
        break;
      case 'Profile':
        targetPage = const HelpProfilePage();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }

  List<Map<String, dynamic>> _messages = [
    {
      'text':
          'Welcome to TravelLounge! Please select a category tag below before typing your question.',
      'isUser': false,
    },
  ];

  // Update this block in _ChatBotScreenState
  final List<Map<String, String>> suggestions = const [
    {'label': 'Countries', 'key': 'countries'},
    {'label': 'Landmarks', 'key': 'landmarks'},
    {'label': 'Dishes', 'key': 'dishes'},
    {'label': 'Airports', 'key': 'airports'},
    {'label': 'Requirements', 'key': 'requirements'},
    {'label': 'Rules', 'key': 'rules'},
    {'label': 'App Tour', 'key': 'tour'}, // Add this line
  ];

  String? selectedCategory;
  String? selectedCountryTag;
  bool isLoading = false;
  bool isAiReady = false;

  @override
  void initState() {
    super.initState();
    _loadHistory();
    _initAi();
    tourDataMap = {
      'Dashboard': TourSection(
        data: helpDashboardData,
        screen: const Dashboard(),
      ),
      'Diary': TourSection(data: helpDiaryData, screen: const DiaryScreen()),
      'Travel': TourSection(
        data: helpTravelData,
        screen: const TravelMenuScreen(),
      ),
      'Features': TourSection(
        data: helpFeaturesData,
        screen: const FeaturesScreen(),
      ),
      'Profile': TourSection(
        data: helpProfileData,
        screen: const ProfileScreen(),
      ),
    };
  }

  // --- PERSISTENCE ---
  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    String? saved = prefs.getString('chat_history');
    if (saved != null) {
      setState(
        () => _messages = List<Map<String, dynamic>>.from(json.decode(saved)),
      );
    }
  }

  Future<void> _saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('chat_history', json.encode(_messages));
  }

  Future<void> _clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat_history');
    setState(
      () => _messages = [
        {
          'text': 'Welcome to TravelLounge! Please select a category.',
          'isUser': false,
        },
      ],
    );
    _saveHistory();
  }

Future<void> _initAi() async {
    setState(() => isLoading = true);
    
    try {
      // Always try to check availability, regardless of platform
      bool available = await _ai.isAvailable();
      if (available) {
        setState(() => isAiReady = true);
      } else {
        // Fallback: If it's not available, you can choose to 
        // enable the simulated responses by setting isAiReady to true 
        // OR handle it differently.
        setState(() => isAiReady = true); // Assuming you want to use the simulator as fallback
      }
    } catch (e) {
      debugPrint("AI Init Error: $e");
      // If the plugin throws an error on Android, 
      // treat the AI as "ready" so your simulated fallback logic takes over
      setState(() => isAiReady = true);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSendMessage(String text) async {
    String lowerText = text.toLowerCase().trim();

    WidgetsBinding.instance.addPostFrameCallback((_) async {

    // --- Landmark Shortcut ---
    if (selectedCategory == 'landmarks') {
      final List<String> landmarkKeywords = [
        'must visit',
        'top landmarks',
        'recommend landmarks',
      ];

      if (landmarkKeywords.any((phrase) => lowerText.contains(phrase))) {
        triggerShortcutResponse(
          text,
          "Top landmarks are the ones listed above! Check the tags to filter by country.",
        );
        return; // Stops here, preventing the database search
      }
    }

    // GREETINGS ---------------------------------------------------------------------------
    final List<String> greetings = ['hi', 'hello', 'hey', 'bro'];
    // Check if the user message starts with any of these words
    bool isGreeting = greetings.any((word) => lowerText.startsWith(word));
    if (isGreeting) {
      setState(() {
        // 1. Add the user's message first
        _messages.add({'text': text, 'isUser': true});
        // 2. Add the bot's response
        _messages.add({
          'text': 'Hello user! Welcome to Chatbot!\nHow may I assist you?',
          'isUser': false,
        });
      });
      _messageController.clear();
      _saveHistory();
      _scrollToBottom();
      return; // Stop here so it doesn't trigger the AI/Tour logic
    }

    // LANDMARKS ---------------------------------------------------------------------------
    final List<String> landmarkKeywords = [
      'must visit',
      'top landmarks',
      'recommend landmarks',
    ];
    // 2. Check if the user message contains any of these phrases
    // AND the user is currently in the 'landmarks' category
    bool isLandmarkQuery =
        selectedCategory == 'landmarks' &&
        landmarkKeywords.any((phrase) => lowerText.contains(phrase));

    if (isLandmarkQuery) {
      setState(() {
        // 1. Add the user's message
        _messages.add({'text': text, 'isUser': true});
        // 2. Add your custom bot response
        _messages.add({
          'text':
              'Top landmarks are the ones listed above! Check the tags to filter by country.',
          'isUser': false,
        });
      });

      _messageController.clear();
      _saveHistory();
      _scrollToBottom();
      return; // Stop here so it doesn't try to search the database
    }

    // DISHES ---------------------------------------------------------------------------
    // 1. Define your dish-specific shortcut keywords
    final List<String> dishKeywords = [
      'best food',
      'must eat',
      'tasty food',
      'recommendation',
    ];

    // 2. Check if the user is in the 'dishes' category and used a shortcut phrase
    bool isDishQuery =
        selectedCategory == 'dishes' &&
        dishKeywords.any((phrase) => lowerText.contains(phrase));

    if (isDishQuery) {
      _sendBotReply(
        text,
        "The best food depends on your taste! Look at the 'Dishes' category for local favorites.",
      );
      return; // Stop here so it doesn't try to search the database
    }

    if (text.trim().isEmpty || !isAiReady) return;

    // Check if we are in the Tour section
    if (selectedCategory == 'tour' && selectedCountryTag != null) {
      // 1. Map all help data lists
      final Map<String, List<dynamic>> tourDataMap = {
        'Dashboard': helpDashboardData,
        'Diary': helpDiaryData,
        'Travel': helpTravelData,
        'Features': helpFeaturesData,
        'Profile': helpProfileData,
      };

      // 2. Get the specific list for the active section (e.g., 'Diary')
      final List<dynamic>? dataList = tourDataMap[selectedCountryTag];

      if (dataList != null) {
        String query = text.toLowerCase();

        // 3. Search for a match in the CORRECT list
        var match = dataList.firstWhereOrNull(
          (item) => query.contains(item.title.toLowerCase()),
        );

        if (match != null) {
          String responseText = "${match.title}:\n${match.description}";

          // 4. Simple logic to add sub-dropdowns ONLY if they exist
          try {
            if ((match as dynamic).subDropdowns != null &&
                (match as dynamic).subDropdowns.isNotEmpty) {
              String subText = (match as dynamic).subDropdowns
                  .map((sub) => "    - ${sub.title}: ${sub.description}")
                  .join("\n");
              responseText += "\n\nDetails:\n$subText";
            }
          } catch (e) {
            // If the item type doesn't have subDropdowns, it just skips this part
          }

          setState(() {
            _messages.add({'text': responseText, 'isUser': false});
          });
        } else {
          // 5. If no keyword match, show the full list for this section
          setState(() {
            _messages.add({
              'text':
                  "Here are the topics for $selectedCountryTag:\n\n${_formatComplexHelp(dataList)}",
              'isUser': false,
            });
          });
        }
      }

      _messageController.clear();
      _saveHistory();
      _scrollToBottom();
      return; // Stop here so the AI isn't triggered
    }

    if ((selectedCategory == 'landmarks' ||
            selectedCategory == 'dishes' ||
            selectedCategory == 'airports' ||
            selectedCategory == 'requirements' ||
            selectedCategory == 'rules') &&
        selectedCountryTag == null) {
      setState(() {
        _messages.add({
          'text':
              '⚠️ Please select a specific country tag from the sub-menu before typing your question.',
          'isUser': false,
        });
      });
      _saveHistory();
      _scrollToBottom();
      return;
    }

    // 1. Ensure you have your 'isMatch' helper function available
    // 2. Use it in your shortcut logic:

    // 1. Check the category and the keywords
    if (selectedCategory == 'tour') {
      final List<String> helpKeywords = ['help', 'how to', 'guide', 'tour'];

      // This checks if the user's input matches any of your keywords
      if (helpKeywords.any((keyword) => isMatch(keyword, text))) {
        // This sends the reply and adds the bubble correctly
        triggerShortcutResponse(
          text,
          "I can help you navigate! Select a section above to see specific instructions.",
        );
        return; // This stops the other logic from running
      }
    }

    setState(() {
      _messages.add({'text': text, 'isUser': true});
      _messageController.clear();
      isLoading = true;
    });
    _saveHistory();
    _scrollToBottom();

    
      await Future.delayed(const Duration(milliseconds: 600));
      String simulatedReply = "";
      switch (selectedCategory) {
        case 'countries':
          String query = text.toLowerCase();
          if (query.contains('philippines') || query.contains('phil')) {
            simulatedReply =
                "The Philippines is an archipelago in Southeast Asia known for its emerald rice fields, teeming megacities, and pristine tropical beaches.";
          } else if (query.contains('thailand')) {
            simulatedReply =
                "Thailand is famous for its tropical beaches, opulent royal palaces, ancient ruins, and ornate temples displaying figures of Buddha.";
          } else if (query.contains('vietnam')) {
            simulatedReply =
                "Vietnam is known for its beautiful beaches, winding rivers, Buddhist pagodas, vibrant culture, and bustling, teeming cities.";
          } else if (query.contains('cambodia')) {
            simulatedReply =
                "Cambodia is a low-lying nation defined by its plains, the massive Mekong Delta, mountains, and the historic Angkor Wat temple complex.";
          } else if (query.contains('indonesia')) {
            simulatedReply =
                "Indonesia is a massive nation made up of thousands of volcanic islands, home to diverse ethnic groups, beaches, volcanoes, and jungles.";
          } else if (query.contains('malaysia')) {
            simulatedReply =
                "Malaysia is a country split across a peninsula and Borneo, famous for its rainforests, bustling modern cities, and diverse cultural mix.";
          } else if (query.contains('singapore')) {
            simulatedReply =
                "Singapore is a global financial hub and island city-state known for its ultra-modern architecture, clean streets, and botanical gardens.";
          } else if (query.contains('myanmar') || query.contains('burma')) {
            simulatedReply =
                "Myanmar is a nation of more than 100 ethnic groups, bordering India and China, famed for its thousands of gilded Buddhist pagodas.";
          } else if (query.contains('laos')) {
            simulatedReply =
                "Laos is a landlocked, mountainous country traversed by the Mekong River, renowned for its French colonial architecture and monastery sites.";
          } else if (query.contains('brunei')) {
            simulatedReply =
                "Brunei is a tiny nation on the island of Borneo, famous for its grand, gold-domed mosques and pristine, protected rainforests.";
          } else if (query.contains('timor') || query.contains('east timor')) {
            simulatedReply =
                "Timor-Leste is a Southeast Asian island nation surrounded by coral reefs rich in marine life, known for its rugged mountains and coffee history.";
          } else {
            simulatedReply =
                "Here are the 11 Southeast Asian countries in TravelLounge:\n★ Philippines\n★ Thailand\n★ Vietnam\n★ Cambodia\n★ Indonesia\n★ Malaysia\n★ Singapore\n★ Myanmar\n★ Laos\n★ Brunei\n★ Timor-Leste\n\nAsk me about a specific one!";
          }
          break;

        case 'landmarks':
          if (selectedCountryTag != null &&
              landmarkDetailsData.containsKey(selectedCountryTag)) {
            String fullDataBlock = landmarkDetailsData[selectedCountryTag]!;
            String foundLine = "";
            List<String> lines = fullDataBlock.split('\n');

            for (String line in lines) {
              if (line.trim().startsWith('-')) {
                // Extract the name part (everything before the colon)
                String landmarkName = line
                    .split(':')[0]
                    .replaceAll('-', '')
                    .trim();

                // Use your flexible helper function
                if (isMatch(landmarkName, text)) {
                  foundLine = line.trim();
                  break; // Stop once we find the match
                }
              }
            }

            simulatedReply = foundLine.isNotEmpty
                ? "Landmark Details:\n\n$foundLine"
                : "Top Landmarks in ${selectedCountryTag!.toUpperCase()}:\n\n$fullDataBlock";
          } else {
            simulatedReply =
                "Please select a country tag from the sub-menu above to filter landmarks.";
          }
          break;

        case 'dishes':
          if (selectedCountryTag != null &&
              dishData.containsKey(selectedCountryTag)) {
            List<Map<String, String>> countryDishes =
                dishData[selectedCountryTag]!;
            String query = text.toLowerCase().trim();

            // 1. Create a list to store all matches
            List<Map<String, String>> matchedDishes = [];

            // 2. Iterate through all items without breaking
            for (var dish in countryDishes) {
              if (isMatch(dish['name']!, query)) {
                matchedDishes.add(dish); // Add to our list instead of stopping
              }
            }

            // 3. Handle the results
            if (matchedDishes.isNotEmpty) {
              // Build a string that shows all matches
              String resultText =
                  "I found ${matchedDishes.length} matches:\n\n";
              for (var dish in matchedDishes) {
                resultText += "★ ${dish['name']}: ${dish['description']}\n";
              }
              simulatedReply = resultText;
            } else {
              simulatedReply = "I couldn't find any dishes matching '$text'.";
            }
          }
          break;

        case 'airports':
          if (selectedCountryTag != null &&
              countryAirportsData.containsKey(selectedCountryTag)) {
            var categories = countryAirportsData[selectedCountryTag]!;
            String query = text.toLowerCase();

            // 1. SEARCH FOR SPECIFIC MATCH
            Map<String, String>? matchedAirport;
            String matchedType = "";

            // Iterate through International and Local categories
            for (var entry in categories.entries) {
              String type = entry.key;
              List<Map<String, String>> list = entry.value;

              var found = list.firstWhereOrNull(
                (airport) => airport['name']!.toLowerCase().contains(query),
              );

              if (found != null) {
                matchedAirport = found;
                matchedType = type;
                break; // Stop looking once we find a match
              }
            }

            // 2. DISPLAY LOGIC
            if (matchedAirport != null) {
              // User searched for a specific airport
              simulatedReply =
                  "✈️ Airport Hub ($matchedType):\n★ Name: ${matchedAirport['name']}\n★ Details: ${matchedAirport['description']}";
            } else {
              // No specific match, show the categorized list (Names only)
              StringBuffer buffer = StringBuffer(
                "Airports in ${selectedCountryTag!.toUpperCase()}:\n\n",
              );

              for (var entry in categories.entries) {
                buffer.writeln("🌐 [${entry.key.toUpperCase()}]");
                for (var airport in entry.value) {
                  buffer.writeln(
                    "★ ${airport['name']}",
                  ); // REMOVED : ${airport['description']}
                }
                buffer.writeln("");
              }
              simulatedReply = buffer.toString();
            }
          } else {
            simulatedReply =
                "Please select a country tag from the sub-menu above to filter airports.";
          }
          break;

        case 'requirements':
          if (selectedCountryTag != null) {
            Map<String, String> tagToCode = {
              'singapore': 'SG',
              'thailand': 'TH',
              'vietnam': 'VN',
              'indonesia': 'ID',
              'malaysia': 'MY',
              'philippines': 'PH',
              'myanmar': 'MM',
              'cambodia': 'KH',
              'laos': 'LA',
              'brunei': 'BN',
              'timor': 'TL',
            };
            String targetCode = tagToCode[selectedCountryTag] ?? "";
            try {
              TravelInfo info = travelInfoData.firstWhere(
                (element) => element.countryCode == targetCode,
              );
              String query = text.toLowerCase();
              if (query.contains('bring') ||
                  query.contains('pack') ||
                  query.contains('stuff')) {
                simulatedReply =
                    "🧳 Packing List for ${selectedCountryTag!.toUpperCase()}:\n\n" +
                    info.whatToBring.map((item) => "★ $item").join("\n");
              } else if (query.contains('rate') ||
                  query.contains('currency') ||
                  query.contains('money') ||
                  query.contains('usd')) {
                simulatedReply =
                    "💵 Currency Exchange Reference:\n\n★ 1 USD ≈ ${info.usdRate} of local currency standard.";
              } else {
                simulatedReply =
                    "📋 Travel Profile: ${selectedCountryTag!.toUpperCase()}\n\n🔒 Requirements:\n${info.requirements.map((item) => '  ★ $item').join('\n')}\n\n🧳 What to Bring:\n${info.whatToBring.map((item) => '  ★ $item').join('\n')}\n\n💵 Currency Base:\n  ★ 1 USD ≈ ${info.usdRate} local value.";
              }
            } catch (e) {
              simulatedReply =
                  "Could not find profile details for code: $targetCode.";
            }
          } else {
            simulatedReply =
                "Please select a country tag from the sub-menu above to see travel requirements.";
          }
          break;

        case 'rules':
          if (selectedCountryTag != null &&
              countryRulesData.containsKey(selectedCountryTag)) {
            List<String> rulesList = countryRulesData[selectedCountryTag]!;
            String query = text.toLowerCase();
            String matchedRule = "";
            for (String rule in rulesList) {
              String lowRule = rule.toLowerCase();
              if (query.contains('drug') && lowRule.contains('drug')) {
                matchedRule = rule;
                break;
              } else if ((query.contains('dress') ||
                      query.contains('wear') ||
                      query.contains('clothe')) &&
                  (lowRule.contains('dress') || lowRule.contains('modest'))) {
                matchedRule = rule;
                break;
              } else if ((query.contains('photo') ||
                      query.contains('camera') ||
                      query.contains('pic')) &&
                  (lowRule.contains('photo') || lowRule.contains('restrict'))) {
                matchedRule = rule;
                break;
              } else if ((query.contains('passport') ||
                      query.contains('id') ||
                      query.contains('document')) &&
                  (lowRule.contains('passport') ||
                      lowRule.contains('carry') ||
                      lowRule.contains('id'))) {
                matchedRule = rule;
                break;
              }
            }
            if (matchedRule.isNotEmpty) {
              simulatedReply = "Rule Detail Found:\n\n📌 $matchedRule";
            } else {
              StringBuffer buffer = StringBuffer(
                "⚠️ Official Customs & Rules for ${selectedCountryTag!.toUpperCase()}:\n\n",
              );
              for (int i = 0; i < rulesList.length; i++) {
                buffer.writeln("${i + 1}. ${rulesList[i]}\n");
              }
              simulatedReply = buffer.toString();
            }
          } else {
            simulatedReply =
                "Please select a country tag from the sub-menu above to filter customs guidelines.";
          }
          break;
        default:
          simulatedReply = "Please select a valid filter.";
      }
      if (mounted) {
        setState(() {
          _messages.add({'text': simulatedReply, 'isUser': false});
        });
        _saveHistory();
        _scrollToBottom();
      }
      setState(() => isLoading = false);
      return;
    

    try {
      String scopedData = "";

      // --- UNIFORM TOUR SEARCH LOGIC ---
      if (selectedCategory == 'tour' && selectedCountryTag != null) {
        // Map categories to their respective data lists
        // Update your map in _buildTags() to include the screen

        final Map<String, TourSection> tourDataMap = {
          'Dashboard': TourSection(
            data: helpDashboardData,
            screen: const Dashboard(),
          ),
          'Diary': TourSection(
            data: helpDiaryData,
            screen: const DiaryScreen(),
          ),
          'Travel': TourSection(
            data: helpTravelData,
            screen: const TravelMenuScreen(),
          ),
          'Features': TourSection(
            data: helpFeaturesData,
            screen: const FeaturesScreen(),
          ),
          'Profile': TourSection(
            data: helpProfileData,
            screen: const ProfileScreen(),
          ),
        };

        // Safely get the section (or null)
        final TourSection? section = tourDataMap[selectedCountryTag];

        // Safely extract the data list
        final List<dynamic>? dataList = section?.data;

        if (dataList != null) {
          String query = text.toLowerCase();

          // Search for a keyword match in the title
          var match = dataList.firstWhere(
            (item) => query.contains(item.title.toLowerCase()),
            orElse: () => null,
          );

          if (match != null) {
            setState(() {
              _messages.add({
                'text': "${match.title}:\n${match.description}",
                'isUser': false,
              });
            });
          } else {
            // Default: show the list if no match
            setState(() {
              _messages.add({
                'text':
                    "Here are the topics for $selectedCountryTag:\n${_formatHelpContent(dataList)}",
                'isUser': false,
              });
            });
          }
          _messageController.clear();
          _saveHistory();
          _scrollToBottom();
          return; // Block AI from responding to tour keywords
        }
      }

      if (selectedCategory == 'countries') scopedData = countryData;

      if (selectedCategory == 'landmarks')
        scopedData = landmarkDetailsData[selectedCountryTag] ?? "";

      if (selectedCategory == 'dishes' &&
          selectedCountryTag != null &&
          dishData.containsKey(selectedCountryTag)) {
        StringBuffer buffer = StringBuffer();
        for (var dish in dishData[selectedCountryTag]!) {
          buffer.writeln(
            "Dish: ${dish['name']}\nDescription: ${dish['description']}\nHistory: ${dish['history']}\nOrigin: ${dish['regionOrigin']}\n---",
          );
        }
        scopedData = buffer.toString();
      }

      if (selectedCategory == 'airports' &&
          selectedCountryTag != null &&
          countryAirportsData.containsKey(selectedCountryTag)) {
        StringBuffer buffer = StringBuffer();
        countryAirportsData[selectedCountryTag]!.forEach((type, list) {
          buffer.writeln("=== $type Airports ===");
          for (var airport in list) {
            buffer.writeln(
              "Airport: ${airport['name']}\nDescription: ${airport['description']}\n---",
            );
          }
        });
        scopedData = buffer.toString();
      }
      if (selectedCategory == 'requirements' && selectedCountryTag != null) {
        Map<String, String> tagToCode = {
          'singapore': 'SG',
          'thailand': 'TH',
          'vietnam': 'VN',
          'indonesia': 'ID',
          'malaysia': 'MY',
          'philippines': 'PH',
          'myanmar': 'MM',
          'cambodia': 'KH',
          'laos': 'LA',
          'brunei': 'BN',
          'timor': 'TL',
        };
        String targetCode = tagToCode[selectedCountryTag] ?? "";
        try {
          TravelInfo info = travelInfoData.firstWhere(
            (element) => element.countryCode == targetCode,
          );
          scopedData =
              "Country Code: ${info.countryCode}\nMandatory Requirements: ${info.requirements.join(', ')}\nRecommended Checklist Items to Bring: ${info.whatToBring.join(', ')}\nCurrency exchange rate baseline per 1 USD: ${info.usdRate}";
        } catch (e) {
          scopedData = "";
        }
      }
      if (selectedCategory == 'rules' &&
          selectedCountryTag != null &&
          countryRulesData.containsKey(selectedCountryTag)) {
        scopedData =
            "Official Rules and Laws for ${selectedCountryTag!.toUpperCase()}:\n" +
            countryRulesData[selectedCountryTag]!.map((r) => "- $r").join("\n");
      }

      await _ai.initialize(
        instructions:
            "You are an isolated data processor for TravelLounge. Your strict context scope limit is: $selectedCategory. DATA SET TO READ FROM: $scopedData. CRITICAL: Do not read from any other data blocks. If information is not inside the data set, declare it unknown.",
      );
      final response = await _ai.generateText(prompt: text);
      if (mounted) {
        setState(() {
          _messages.add({
            'text': response.text ?? "No information found.",
            'isUser': false,
          });
        });
        _saveHistory();
        _scrollToBottom();
      }
    } catch (e) {
      debugPrint("AI Error: $e");
    } finally {
      setState(() => isLoading = false);
    }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainYellow,
        title: const Text(
          'Chatbot',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.black),
            onPressed: _clearHistory,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              // In your ListView.builder:
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _chatBubble(
                  msg['text'],
                  msg['isUser'],
                  action: msg['action'], // Pass the action here
                );
              },
            ),
          ),
          if (isLoading) const LinearProgressIndicator(color: mainYellow),
          _buildTags(),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildTags() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: suggestions.map((s) {
              final isSelected = selectedCategory == s['key'];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(
                    s['label']!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: mainPurple,
                  backgroundColor: mainYellow,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedCategory = selected ? s['key'] : null;
                      selectedCountryTag = null;
                      if (selectedCategory != null) {
                        _messages.add({
                          'text':
                              'Category switched to ${s["label"]}. Now you can type your question!',
                          'isUser': false,
                        });
                        _saveHistory();
                      }
                    });
                    _scrollToBottom();
                  },
                ),
              );
            }).toList(),
          ),
        ),

        // Inside _buildTags()
        if (selectedCategory == 'tour')
          Container(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ['Dashboard', 'Diary', 'Travel', 'Features', 'Profile'].map((
                section,
              ) {
                // 'section' is now defined here!
                final isSubSelected = selectedCountryTag == section;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(section),
                    selected: isSubSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCountryTag = selected ? section : null;
                        if (selectedCountryTag != null) {
                          // 1. Define the Map (You can also put this map as a class constant)
                          final Map<String, List<dynamic>> tourDataMap = {
                            'Dashboard': helpDashboardData,
                            'Diary': helpDiaryData,
                            'Travel': helpTravelData,
                            'Features': helpFeaturesData,
                            'Profile': helpProfileData,
                          };

                          // 2. Get the data list dynamically
                          List<dynamic>? dataList = tourDataMap[section];

                          if (dataList != null) {
                            // 3. Generate the menu display (Titles only)
                            String helpText =
                                "Learn about $section:\n" +
                                dataList
                                    .map((item) => "- ${item.title}")
                                    .join("\n") +
                                "\n\nType the title of an item to see its full description!";
                            _messages.add({
                              'text': helpText,
                              'isUser': false,
                              'action': section,
                            });
                            _saveHistory();
                            _scrollToBottom();
                          } else {
                            // Fallback
                            _navigateToHelpSection(section);
                          }
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

        if (selectedCategory == 'landmarks' ||
            selectedCategory == 'dishes' ||
            selectedCategory == 'airports' ||
            selectedCategory == 'requirements' ||
            selectedCategory == 'rules')
          Container(
            height: 45,
            color: Colors.grey[50],
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children:
                  [
                    'brunei',
                    'cambodia',
                    'indonesia',
                    'laos',
                    'malaysia',
                    'myanmar',
                    'philippines',
                    'singapore',
                    'thailand',
                    'vietnam',
                    'timor',
                  ].map((country) {
                    final isSubSelected = selectedCountryTag == country;
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      child: ChoiceChip(
                        label: Text(
                          country.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: isSubSelected ? Colors.white : mainPurple,
                          ),
                        ),
                        selected: isSubSelected,
                        selectedColor: Colors.purple[400],
                        backgroundColor: Colors.white,
                        shape: const StadiumBorder(
                          side: BorderSide(color: mainPurple, width: 1),
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            selectedCountryTag = selected ? country : null;
                            if (selectedCountryTag != null) {
                              String title = "";
                              String displayNames = "";

                              if (selectedCategory == 'landmarks') {
                                // LANDMARK LOGIC
                                String fullData =
                                    landmarkDetailsData[selectedCountryTag] ??
                                    "";
                                List<String> lines = fullData.split('\n');
                                displayNames = lines
                                    .map((line) {
                                      if (line.trim().startsWith('-')) {
                                        return "- ${line.split(':')[0].replaceAll('-', '').trim()}";
                                      }
                                      return "";
                                    })
                                    .where((line) => line.isNotEmpty)
                                    .join("\n");
                                title = "must-visit landmarks";
                              } else if (selectedCategory == 'dishes') {
                                // DISH LOGIC
                                var countryDishes =
                                    dishData[selectedCountryTag] ?? [];
                                displayNames = countryDishes
                                    .map((dish) => "- ${dish['name']}")
                                    .join("\n");
                                title = "must-try dishes";
                              } else if (selectedCategory == 'airports') {
                                // AIRPORT LOGIC
                                var airportData =
                                    countryAirportsData[selectedCountryTag];

                                if (airportData != null) {
                                  // Extract International names
                                  String internationalList =
                                      (airportData['International'] as List)
                                          .map((a) => "- ${a['name']}")
                                          .join("\n");

                                  // Extract Local names
                                  String localList =
                                      (airportData['Local'] as List)
                                          .map((a) => "- ${a['name']}")
                                          .join("\n");

                                  displayNames =
                                      "International:\n$internationalList\n\nLocal:\n$localList";
                                  title =
                                      "Major International and Local airports in ${country.toUpperCase()}";
                                }
                              }

                              // Add the message only if we processed data
                              if (displayNames.isNotEmpty) {
                                _messages.add({
                                  'text':
                                      "The top $title in ${country.toUpperCase()} are:\n\n$displayNames",
                                  'isUser': false,
                                });
                                _saveHistory();
                              }
                            }
                          });
                          _scrollToBottom();
                        },
                      ),
                    );
                  }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onSubmitted: _handleSendMessage,
              decoration: const InputDecoration(
                hintText: "Ask a question about the active category...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: mainPurple),
            onPressed: () => _handleSendMessage(_messageController.text),
          ),
        ],
      ),
    );
  }

  Widget _chatBubble(String message, bool isUser, {String? action}) {
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          // The original bubble
          Row(
            mainAxisAlignment: isUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!isUser) const Icon(Icons.android, color: Colors.yellow),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isUser ? mainPurple : Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // --- NEW: The Navigation Button ---
          if (action != null && tourDataMap.containsKey(action))
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 40),
              child: ElevatedButton(
                onPressed: () {
                  globals.isFromChat = true;
                  final targetScreen = tourDataMap[action]!.screen;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => targetScreen),
                  );
                },
                child: Text("Go to $action"),
              ),
            ),
        ],
      ),
    );
  }
}
