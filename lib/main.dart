import 'package:flutter/material.dart';
import 'package:raftlabassesment/internet_status.dart';
import 'package:raftlabassesment/screen_one.dart';

import 'package:raftlabassesment/web_view.dart';

void main() {
  runApp(BottomNavigation());
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  final List<Widget> screens = [Screenone(), Status(), WebView()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue.shade200,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Screen One',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Screen Two',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Screen Three',
              icon: Icon(Icons.web),
            ),
          ],
        ),
      ),
    );
  }
}
