// ignore_for_file: prefer_const_constructors

import 'package:ecmapp/screens/profilepage.dart';
import 'package:ecmapp/screens/savedpage.dart';
import 'package:ecmapp/screens/searchscreen.dart';
import 'package:flutter/material.dart';

import 'mainscreen.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int selectedIndex = 0;

  final _screens = [
    MainScreen(),
    SearchScreen(),
    SavedPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
      onTap: (newIndex) {
        setState(() {
          selectedIndex = newIndex;
        });

      },
        elevation: 10,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: "Home"),

          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"),

          BottomNavigationBarItem(
              icon: Icon(Icons.save_outlined),
              label: "Saved"),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person"),
        ],
      ),
    );
  }
}
