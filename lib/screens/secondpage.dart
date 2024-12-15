import 'package:flutter/material.dart';
// import 'package:easeher/screens/CalenderSection.dart';
// import 'package:easeher/screens/CommunityPage.dart';
// import 'package:easeher/screens/newpage.dart';
// import 'package:easeher/screens/Deal.dart';
// import 'package:easeher/screens/homePage.dart';

//import 'package:easeher/screens/secondpage.dart';
// import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Period Health Issues",
        ),
        backgroundColor: Colors.pink.shade300,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade200, Colors.pink.shade400],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Common Period Health Issues",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Explore the common issues women face during periods and ways to manage them.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            // Cards for Health Problems Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHealthIssueCard(
                    "Cramps",
                    Icons.local_hospital,
                    Colors.pink.shade300,
                    "Painful cramps caused by uterine contractions. Try heat therapy and OTC meds for relief.",
                    () {
                      // Navigate to detailed page for cramps
                    },
                  ),
                  const SizedBox(height: 20),
                  buildHealthIssueCard(
                    "PCOS (Polycystic Ovary Syndrome)",
                    Icons.female,
                    Colors.teal.shade300,
                    "Hormonal imbalance leading to irregular periods. Management includes lifestyle changes and meds.",
                    () {
                      // Navigate to detailed page for PCOS
                    },
                  ),
                  const SizedBox(height: 20),
                  buildHealthIssueCard(
                    "PCOD (Polycystic Ovarian Disease)",
                    Icons.track_changes,
                    Colors.orange.shade300,
                    "Ovaries develop multiple cysts affecting fertility and periods. Treatment involves lifestyle changes and medication.",
                    () {
                      // Navigate to detailed page for PCOD
                    },
                  ),
                  const SizedBox(height: 20),
                  buildHealthIssueCard(
                    "Heavy Periods",
                    Icons.healing,
                    Colors.red.shade300,
                    "Excessive menstrual flow causing fatigue. Treatments include hormonal therapies and medications.",
                    () {
                      // Navigate to detailed page for heavy periods
                    },
                  ),
                  const SizedBox(height: 20),
                  buildHealthIssueCard(
                    "Irregular Periods",
                    Icons.access_time,
                    Colors.purple.shade300,
                    "Periods that are inconsistent in frequency and duration. Treatment depends on underlying causes.",
                    () {
                      // Navigate to detailed page for irregular periods
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

  // Reusable Widget for Health Issue Cards
  Widget buildHealthIssueCard(
    String title,
    IconData icon,
    Color color,
    String description,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 180, // Increased card height
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 60, color: color), // Enlarged icon
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
