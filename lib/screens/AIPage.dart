// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class AI_Page extends StatefulWidget {
  const AI_Page({super.key});

  @override
  State<AI_Page> createState() => _AI_PageState();
}

class _AI_PageState extends State<AI_Page> {
  final TextEditingController _messageController = TextEditingController();

  // Define the messages list here to store both user and AI messages
  List<String> messages = ["AI: How can I help you"];

  // Function to handle sending messages
  void _newMessage() {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        // Add the user's message
        messages.add("You: $message");

        // Simulate an AI response
        messages.add("AI:How can i help you further !!");
      });
      _messageController.clear(); // Clear the input field after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                //  Navigator.push(
                //    context,
                //    MaterialPageRoute(builder: (context) => AccountPages()),
                //  );
              },
              child: const Icon(
                Icons.account_circle,
                color: Color(0xFF5C6BC0),
                size: 30,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Easeher',
              style: TextStyle(
                color: Color(0xFF5C6BC0),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white, // Pink background for entire page
        child: Column(
          children: [
            // Display all messages (user and AI)
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  bool isAIMessage = messages[index].startsWith("AI:");

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      messages[index],
                      style: TextStyle(
                        fontSize: isAIMessage
                            ? 24
                            : 24, // Larger font size for AI's message
                        color: isAIMessage ? Colors.black : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Curved message input box at the bottom
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white54, // Input box color same as navigation bar
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        filled: true,
                        fillColor:
                            Colors.white, // Slight contrast for input box
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF5C6BC0)),
                    onPressed:
                        _newMessage, // Call _newMessage to update chat messages
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
