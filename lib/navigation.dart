import 'dart:ffi';

import 'package:flutter/material.dart';
import 'pages/testUI.dart';
import 'pages/TodayView.dart';
import 'pages/InboxView.dart';
import 'pages/NotesView.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TodayView(),
    InboxView(),
    NotesView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.today), label: "today"),
            BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
