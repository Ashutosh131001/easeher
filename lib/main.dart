// ignore_for_file: library_private_types_in_public_api

import 'package:easeher/screens/CalenderSection.dart';
import 'package:easeher/screens/CommunityPage.dart';
// import 'package:easeher/screens/newpage.dart';
import 'package:easeher/screens/Deal.dart';
import 'package:easeher/screens/homePage.dart';

import 'package:easeher/screens/secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easeher',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const homePage(),
    const secondpage(),
    const PeriodTrackers(),
    const CommunityPage(),
    const MenCarePage(), // Add the fifth page here
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Directly display the page based on index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.woman_outlined),
            label: 'Care', // Add fifth item here
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
