class ChatMessage {
  final String text;
  final bool isUser;

  // Constructor: This allows us to create a message like 
  // ChatMessage(text: "Hello", isUser: true)
  ChatMessage({
    required this.text, 
    required this.isUser,
  });
}