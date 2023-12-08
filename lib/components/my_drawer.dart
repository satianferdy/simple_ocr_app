import 'package:flutter/material.dart';
import 'package:simple_ocr_app/helper/my_color.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'assets/images/logo.png',
                  // color: Colors.white,
                ),
              ),

              const SizedBox(height: 48),

              // other pages
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: MyColor.darkBlue,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: MyColor.darkBlue),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.place,
                    color: MyColor.darkBlue,
                  ),
                  title: Text(
                    'Workplace',
                    style: TextStyle(color: MyColor.darkBlue),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: MyColor.darkBlue,
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(color: MyColor.darkBlue),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: MyColor.darkBlue,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(color: MyColor.darkBlue),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: MyColor.darkBlue,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: MyColor.darkBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
