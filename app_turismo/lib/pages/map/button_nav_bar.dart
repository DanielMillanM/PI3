// ignore_for_file: prefer_const_constructors

import 'package:app_turismo/pages/favorites.dart';
import 'package:app_turismo/pages/map/draggable_favorite.dart';
import 'package:app_turismo/pages/map/google_map.dart';
import 'package:app_turismo/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _currentIndex = 0;

  final screens = [
    const MapScreen(),
    const MyFavorites(),
    const MySettings(),
  ];

  Widget currentBody = const MapScreen(); // Initial body

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 55, 58, 85),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 55, 58, 85),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 77, 81, 112),
            gap: 8,
            onTabChange: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.map,
                text: 'Mapa',
              ),
              GButton(
                icon: Icons.star,
                text: 'Favoritos',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ]
          )
        )
      )
    );
  }
}
