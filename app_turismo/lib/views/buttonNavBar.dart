import 'package:app_turismo/views/container.dart';
import 'package:app_turismo/views/draggableFavorite.dart';
import 'package:app_turismo/views/googleMap.dart';
import 'package:flutter/material.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _currentIndex = 0;
  Widget currentBody = const ReturnContainer(); // Initial body

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentBody, // Display the current body based on index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
            switch (newIndex) {
              case 0: // Home
                currentBody = ReturnContainer();
                break;
              case 1: // Favorite
                currentBody = favModal(context);
                break;
              case 2: // Profile
                currentBody = const Icon(Icons.person);
                break;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Favorite", icon: Icon(Icons.star_border)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
