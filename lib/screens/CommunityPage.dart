import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _messageController = TextEditingController();

  // Function to handle the message sending
  void _newMessage() {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      print("New message sent: $message");
      _messageController
          .clear(); // Clear the text field after sending the message
    }
  }

  @override
  void dispose() {
    _messageController
        .dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        elevation: 5,
        title: Text(
          "EaseHer Community",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade300, Colors.pink.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade200, Colors.pink.shade300],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to EaseHer Community!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Connect, share, and learn from others' experiences.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Posts Section
            Expanded(
              child: ListView(
                children: [
                  buildPostCard(
                    context,
                    "User123",
                    "I recently started using mindfulness techniques, and it has helped me manage my stress during my periods. Anyone else has tips to share?",
                  ),
                  buildPostCard(
                    context,
                    "HealthExpert",
                    "Remember to stay hydrated! It can help reduce cramps and improve your overall mood during your cycle.",
                  ),
                  buildPostCard(
                    context,
                    "FitnessFan",
                    "I've been doing light yoga during my period, and it makes a huge difference. Highly recommend trying it!",
                  ),
                  buildPostCard(
                    context,
                    "ChefLover",
                    "Does anyone have quick, easy recipes that are period-friendly? I love experimenting in the kitchen!",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade300,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // Action to create a new post
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return NewPostDialog();
            },
          );
        },
      ),
    );
  }

  // Post Card Widget
  Widget buildPostCard(BuildContext context, String user, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade300,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 18, color: Colors.pink.shade300),
                    const SizedBox(width: 5),
                    Text(
                      "Like",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment, size: 18, color: Colors.pink.shade300),
                    const SizedBox(width: 5),
                    Text(
                      "Comment",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Dialog for creating a new post
class NewPostDialog extends StatefulWidget {
  @override
  _NewPostDialogState createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text("Create a Post"),
      content: TextField(
        controller: _postController,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: "What's on your mind?",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog without posting
          },
          child: Text("Cancel", style: TextStyle(color: Colors.black54)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Action to save the post
            if (_postController.text.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Your post has been shared!"),
                backgroundColor: Colors.pink.shade300,
              ));
              Navigator.of(context).pop();
            }
          },
          child: Text("Post"),
        ),
      ],
    );
  }
}
