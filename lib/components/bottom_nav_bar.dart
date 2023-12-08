import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int) onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        color: Color.fromRGBO(24, 16, 89, 1),
        activeColor: Color.fromRGBO(24, 16, 89, 1),
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.white,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabBorderRadius: 24,
        onTabChange: (value) => onTabChange(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            // text: 'Home',
          ),
          GButton(
            icon: Icons.work,
            // text: 'Workplace',
          ),
          GButton(
            icon: Icons.notifications,
            // text: 'Notifications',
          ),
          GButton(
            icon: Icons.person,
            // text: 'Profile',
          ),
        ],
      ),
    );
  }
}
