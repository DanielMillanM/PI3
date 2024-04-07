// ignore_for_file: prefer_const_constructors

import 'package:app_turismo/pages/map/container.dart';
import 'package:app_turismo/pages/map/draggable_favorite.dart';
import 'package:app_turismo/pages/map/google_map.dart';
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
    const Icon(Icons.abc),
    const Icon(Icons.ac_unit_rounded),
  ];

  Widget currentBody = const ReturnContainer(); // Initial body

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
                text: 'Perfil',
              ),
            ]
          )
        )
      )
      // BottomNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 55, 58, 85),
      //   currentIndex: _currentIndex,
      //   onTap: (newIndex) {
      //     setState(() {
      //       _currentIndex = newIndex;
      //     });
      //   },
      //   unselectedItemColor: Colors.white,
      //   fixedColor: Colors.white,
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: "Home", 
      //       backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.white,
      //       )
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Favorite",
      //       icon: Icon(
      //         Icons.star_border,
      //         color: Colors.white,
      //       )
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Profile", 
      //       icon: Icon(
      //         Icons.person,
      //         color: Colors.white,
      //       )
      //     ),
      //   ],
      // ),
    );
  }
}
