// ignore_for_file: camel_case_types

import 'package:easeher/screens/AIPage.dart';
import 'package:easeher/screens/AccountPage.dart';
import 'package:easeher/screens/CalenderSection.dart';
// import 'package:easeher/screens/AccountPage.dart';
import 'package:easeher/screens/Health_tracker.dart';
// import 'package:easeher/utils/app_colors.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:easeher/screens/AIPage.dart';
// import 'package:easeher/screens/Health_tracker.dart';
// // import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300, // Pink gradient base color
        elevation: 5, // Subtle elevation for the AppBar
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Open the menu drawer or side navigation
          },
        ),
        title: const Text(
          "EaseHer",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          // Profile Icon for navigation
          IconButton(
            icon:
                const Icon(Icons.account_circle, color: Colors.white, size: 30),
            onPressed: () {
              // Navigate to the profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink.shade300,
                Colors.pink.shade500
              ], // Gradient from light pink to dark pink
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Added scroll functionality
        child: Column(
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to EaseHer",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation to a page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PeriodTrackers()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Explore Now"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Features Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "EaseHer Features",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 110, // Adjusted height for feature cards
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildFeatureCard(
                            "Self-Care Tips", Icons.spa, Colors.green, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelfCarePage()),
                          );
                        }),
                        buildFeatureCard("Period Tracking",
                            Icons.calendar_today, Colors.orange, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PeriodTrackingPage()),
                          );
                        }),
                        buildFeatureCard(
                            "Mental Wellness", Icons.mood, Colors.purple, () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MentalWellnessPage()),
                          // );
                        }),
                        buildFeatureCard(
                            "Diet & Nutrition", Icons.restaurant, Colors.red,
                            () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => DietNutritionPage()),
                          // );
                        }),
                        buildFeatureCard(
                            "Relaxation", Icons.nights_stay, Colors.blue, () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => RelaxationPage()),
                          // );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Track Your Day Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Track Your Day",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Keep track of your wellness and daily progress.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Progress Bar
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.3, // Progress percentage (30%)
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nov 20"),
                      Text("Today"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // AI Chatbot and Ovulation Tracker Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Advanced Tools",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildFeatureButton(
                        title: "AI Chatbot",
                        icon: Icons.chat,
                        color: Colors.teal,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AI_Page()),
                          );
                        },
                      ),
                      buildFeatureButton(
                        title: "Ovulation Tracker",
                        icon: Icons.track_changes,
                        color: Colors.deepOrange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const secondpage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for EaseHer Features with Navigation
  Widget buildFeatureCard(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Button for Tools (AI Chatbot and Ovulation Tracker) with Navigation
  Widget buildFeatureButton({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 120,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Example placeholder pages for navigation
class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explore Page")),
      body: const Center(child: Text("Explore Page Content")),
    );
  }
}

class SelfCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Self-Care Tips")),
      body: const Center(child: Text("Self-Care Tips Content")),
    );
  }
}

class PeriodTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Period Tracking")),
      body: const Center(child: Text("Period Tracking Content")),
    );
  }
}

// Add other page classes as needed for different navigation.
