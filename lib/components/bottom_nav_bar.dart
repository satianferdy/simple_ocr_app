import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:simple_ocr_app/helper/my_color.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int) onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColor.darkBlue,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.grey,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GNav(
        // color: MyColor.darkBlue.withOpacity(0.6),
        // activeColor: MyColor.darkBlue,
        color: Colors.grey,
        activeColor: Colors.white,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        onTabChange: (value) => onTabChange(value),
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            iconSize: 32,
          ),
          GButton(
            icon: Icons.history_outlined,
            iconSize: 32,
          ),
          GButton(
            icon: Icons.notifications_outlined,
            iconSize: 32,
          ),
          GButton(
            icon: Icons.person_outline,
            iconSize: 32,
          ),
        ],
      ),
    );
  }
}
