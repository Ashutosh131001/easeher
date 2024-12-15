import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    // Example: Period cycle of 28 days, and today is day 10
    int totalCycleDays = 28;
    int currentDay =
        16; // This should be dynamic based on user input or calculation
    double cycleProgress = currentDay / totalCycleDays; // Calculate progress

    // Determine phase based on the current day
    String currentPhase = "";
    String phaseDescription = "";
    int remainingDays = totalCycleDays - currentDay;

    if (currentDay <= 5) {
      currentPhase = "Period";
      phaseDescription = "You are currently on your period days.";
    } else if (currentDay <= 14) {
      currentPhase = "Follicular Phase";
      phaseDescription = "You are in the follicular phase.";
    } else if (currentDay <= 21) {
      currentPhase = "Ovulation";
      phaseDescription = "You are in the ovulation phase.";
    } else {
      currentPhase = "Luteal Phase";
      phaseDescription = "You are in the luteal phase.";
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Health Tracker',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xFF5C6BC0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding around the screen
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular progress indicator
              CircularPercentIndicator(
                radius: 150.0, // The size of the circle
                lineWidth: 25.0, // Width of the progress line
                animation: true,
                animationDuration: 1000,
                percent: cycleProgress, // Percentage of completion
                center: Text(
                  '${(cycleProgress * 100).toStringAsFixed(1)}%', // Shows percentage
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor:
                    Colors.grey[200]!, // Background color of the circle
                progressColor: Colors.pink, // Color of the progress line
              ),

              // Spacing to separate the text from the circle
              SizedBox(height: 30),

              // Text for current phase and remaining days
              Text(
                "Current Phase: $currentPhase",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                phaseDescription,
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                "$remainingDays days until your next period",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
