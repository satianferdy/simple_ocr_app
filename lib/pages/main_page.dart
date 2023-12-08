import 'package:flutter/material.dart';
import 'package:simple_ocr_app/components/bottom_nav_bar.dart';
import 'package:simple_ocr_app/components/my_drawer.dart';
import 'package:simple_ocr_app/pages/home_page.dart';
import 'package:simple_ocr_app/pages/notif_page.dart';
import 'package:simple_ocr_app/pages/profile_page.dart';
import 'package:simple_ocr_app/pages/workplace_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // this selected index will be used to change the bottom navigation bar
  int selectedIndex = 0;

  // this method will update the selected index
  // when the bottom navigation bar is tapped
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> pages = [
    // home page
    const HomePage(),

    // workplace page
    const WorkplacePage(),

    // notif page
    const NotifPage(),

    // profile page
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: pages[selectedIndex],
    );
  }
}
