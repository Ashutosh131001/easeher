import 'package:easeher/screens/AIPage.dart';
import 'package:easeher/screens/Deal.dart';
import 'package:easeher/screens/Health_tracker.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => AccountPages();
}

class AccountPages extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
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
          ])),
      body: Column(
        children: [
          //pink container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC1CC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFFFc1cc)),
                    child: const Icon(
                      Icons.person,
                      size: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Hello User',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
            ),
          ),

          // Add some space between the container and the row
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),

          // Row with three buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Evenly space out buttons
              children: [
                // First Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      // Action for first button
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => secondpage()),
                      );
                    },
                    child: const Text(
                      "Health Tracker",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),

                // Second Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AI_Page()),
                      );
                    },
                    child: const Text(
                      "ChatBot",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),

                // Third Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenCarePage()),
                      );
                    },
                    child: const Text(
                      "Notes",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white70),
            child: const Row(
              children: [
                Icon(
                  Icons.notifications,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Reminders",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white70),
            child: const Row(
              children: [
                Icon(
                  Icons.language,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Language",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white70),
            child: const Row(
              children: [
                Icon(
                  Icons.brightness_2,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Theme",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white70),
            child: const Row(
              children: [
                Icon(
                  Icons.help,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Help",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
