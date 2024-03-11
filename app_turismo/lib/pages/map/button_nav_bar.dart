import 'package:app_turismo/pages/map/container.dart';
import 'package:app_turismo/pages/map/draggable_favorite.dart';
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
        backgroundColor: Color.fromARGB(255, 55, 58, 85),
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
                currentBody = const Icon(
                  Icons.person, 
                  color: Colors.black,
                  );
                break;
            }
          });
        },
        unselectedItemColor: Colors.white,
        fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: "Home", 
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            )
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(
              Icons.star_border,
              color: Colors.white,
            )
          ),
          BottomNavigationBarItem(
            label: "Profile", 
            icon: Icon(
              Icons.person,
              color: Colors.white,
            )
          ),
        ],
      ),
    );
  }
}
