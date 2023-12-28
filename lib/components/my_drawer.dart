import 'package:flutter/material.dart';
import 'package:simple_ocr_app/helper/my_color.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

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
                  'assets/images/logoo.png',
                  width: 80,
                ),
              ),

              const SizedBox(height: 48),

              // other pages
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: MyColor.darkBlue,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(color: MyColor.darkBlue),
                  ),
                  onTap: () {
                    // this is already the home screen so just close the drawer
                    Navigator.pop(context);
                  },
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
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: MyColor.darkBlue,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: MyColor.darkBlue),
              ),
              onTap: () {
                // logout
                Navigator.pop(context);

                // logout
                logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
