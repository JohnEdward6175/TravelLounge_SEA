import 'package:flutter/material.dart';

import 'package:my_app/models/chat_message.dart';
import 'package:my_app/services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  // 1. The list that stores all the messages in the current session
  final List<ChatMessage> _messages = [];
  
  // 2. Instance of the Service to talk to Laravel
  final ChatService _chatService = ChatService();

  // 3. A loading state to show a spinner while waiting for the AI
  bool _isLoading = false;

  // Getters to access private variables from the UI
  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  // 4. The main function to send a message
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add the user's message to the list immediately
    _messages.add(ChatMessage(text: text, isUser: true));
    _isLoading = true;
    notifyListeners(); // Refresh the screen

    try {
      // Call the Laravel backend via the Service
      final response = await _chatService.sendMessage(text);

      // Add the AI's reply to the list
      _messages.add(ChatMessage(text: response, isUser: false));
    } catch (e) {
      _messages.add(ChatMessage(text: "Error: Could not reach the server.", isUser: false));
    } finally {
      _isLoading = false;
      notifyListeners(); // Refresh the screen again
    }
  }

  // Optional: Clear chat history
  void clearChat() {
    _messages.clear();
    notifyListeners();
  }
}