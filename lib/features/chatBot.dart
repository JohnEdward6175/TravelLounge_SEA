import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_app/models/chat_message.dart';
import 'package:my_app/provider/chat_provider.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  // Controller to handle the text input
  final TextEditingController _messageController = TextEditingController();
  
  final List<Map<String, String>> suggestions = const [
    {'label': 'Landmarks', 'type': 'landmark'},
    {'label': 'Dishes', 'type': 'dish'},
    {'label': 'What to Bring', 'type': 'bring'},
    {'label': 'Rules', 'type': 'rule'},
  ];

  bool showHistory = false;
  static const Color mainPurple = Color(0xFF673AB7); // Adjusted to a standard Purple for contrast
  static const Color mainYellow = Color(0xFFF3DC0D);

  final List<String> chatHistory = [
    "User asked about Thailand packing list",
    "User asked about local dishes",
    "User asked about landmarks in Vietnam",
  ];

  OverlayEntry? _overlayEntry;

  void _toggleHistory() {
    if (showHistory) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    setState(() {
      showHistory = !showHistory;
    });
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _toggleHistory,
            child: Container(color: Colors.black12),
          ),
          TweenAnimationBuilder<Offset>(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            tween: Tween(begin: const Offset(-1, 0), end: const Offset(0, 0)),
            builder: (context, offset, child) {
              return FractionalTranslation(
                translation: offset,
                child: child,
              );
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Material(
                elevation: 16,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 20,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Chat History",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: chatHistory.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.history, color: Colors.grey),
                              title: Text(chatHistory[index], style: const TextStyle(fontSize: 14)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We listen to the Provider here
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: mainPurple,
        elevation: 0,
        title: const Text('AskBot', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.history, color: Colors.white),
          onPressed: _toggleHistory,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. DYNAMIC CHAT LIST
          Expanded(
            child: chatProvider.messages.isEmpty 
              ? const Center(child: Text("Start your travel journey!"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final msg = chatProvider.messages[index];
                    return _chatBubble(msg.text, msg.isUser);
                  },
                ),
          ),

          // 2. LOADING INDICATOR
          if (chatProvider.isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: LinearProgressIndicator(color: mainYellow, backgroundColor: Colors.transparent),
            ),

          // 3. SUGGESTIONS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: suggestions.map((suggestion) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        chatProvider.sendMessage("Tell me about ${suggestion['label']} in Southeast Asia");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: mainYellow,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          suggestion['label']!,
                          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // 4. INPUT BAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onSubmitted: (value) {
                      chatProvider.sendMessage(value);
                      _messageController.clear();
                    },
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (_messageController.text.isNotEmpty) {
                      chatProvider.sendMessage(_messageController.text);
                      _messageController.clear();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: mainPurple,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatBubble(String message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUser ? mainPurple : Colors.white,
          border: isUser ? null : Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 16),
          ),
          boxShadow: [
            if (!isUser) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
          ],
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}