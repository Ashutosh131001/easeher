import 'package:flutter/material.dart';

class MenCarePage extends StatefulWidget {
  const MenCarePage({super.key});

  @override
  State<MenCarePage> createState() => _MenCarePageState();
}

class _MenCarePageState extends State<MenCarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        elevation: 5, // Adds subtle shadow for elevation
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back or do something when back button is pressed
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Men's Support for Women",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              // Navigate to Help Page or show some help functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to Settings Page
            },
          ),
        ],
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
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // Heading for Understanding Periods
            Text(
              "Understanding Periods",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            // Horizontal ListView for Understanding Periods
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildSupportCard(
                    "Menstrual Cycle",
                    Icons.calendar_today,
                    Colors.pink.shade300,
                    () {
                      // Navigate to a detailed page about menstrual cycle
                    },
                  ),
                  buildSupportCard(
                    "Cramps",
                    Icons.local_hospital,
                    Colors.green.shade300,
                    () {
                      // Navigate to a detailed page about cramps
                    },
                  ),
                  buildSupportCard(
                    "Heavy Flow",
                    Icons.healing,
                    Colors.red.shade300,
                    () {
                      // Navigate to a detailed page about heavy flow
                    },
                  ),
                  buildSupportCard(
                    "Emotional Changes",
                    Icons.mood,
                    Colors.orange.shade300,
                    () {
                      // Navigate to a detailed page about emotional support
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Heading for How to Support
            Text(
              "How to Support",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            // Horizontal ListView for How to Support
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildSupportCard(
                    "Comfort with Cramps",
                    Icons.local_hospital,
                    Colors.blue.shade300,
                    () {
                      // Navigate to a detailed page about helping with cramps
                    },
                  ),
                  buildSupportCard(
                    "Encourage Rest",
                    Icons.bed,
                    Colors.green.shade400,
                    () {
                      // Navigate to a page about supporting rest
                    },
                  ),
                  buildSupportCard(
                    "Be Patient",
                    Icons.timer,
                    Colors.purple.shade300,
                    () {
                      // Navigate to emotional support page
                    },
                  ),
                  buildSupportCard(
                    "Maintain Hygiene",
                    Icons.wash,
                    Colors.blue.shade400,
                    () {
                      // Navigate to hygiene support page
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Heading for How to Handle Difficult Situations
            Text(
              "How to Handle Difficult Situations",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            // Horizontal ListView for Handling Difficult Situations
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildSupportCard(
                    "Dealing with Mood Swings",
                    Icons.mood_bad,
                    Colors.red.shade400,
                    () {
                      // Navigate to a page about handling mood swings
                    },
                  ),
                  buildSupportCard(
                    "Handling Physical Discomfort",
                    Icons.healing,
                    Colors.pink.shade300,
                    () {
                      // Navigate to physical support page
                    },
                  ),
                  buildSupportCard(
                    "Providing Mental Support",
                    Icons.accessibility,
                    Colors.orange.shade300,
                    () {
                      // Navigate to mental support page
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for Support Cards
  Widget buildSupportCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
