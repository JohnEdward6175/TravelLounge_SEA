import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  // Use 10.0.2.2 if you are using an Android Emulator
  // Use 127.0.0.1 if you are testing on Windows/Chrome
  // final String baseUrl = "http://10.0.2.2:8000/api/chat";

  final String baseUrl = "http://127.0.0.1:8000/api/chat";

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'message': message, // This matches $request->input('message') in Laravel
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['reply']; // This matches 'reply' in your Laravel JSON response
      } else {
        return "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Connection failed. Make sure Laravel is running!";
    }
  }
}