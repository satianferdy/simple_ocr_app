import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_ocr_app/components/my_back_button.dart';
import 'package:simple_ocr_app/helper/my_color.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // error
          else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          // data received
          else if (snapshot.hasData) {
            // user details
            Map<String, dynamic>? userDetails = snapshot.data!.data();

            return Center(
              child: Column(
                children: [
                  // user profile icon
                  Container(
                    decoration: BoxDecoration(
                      color: MyColor.darkBlue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),

                  const SizedBox(height: 20),
                  // user email
                  Text(
                    userDetails!['username'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),
                  // user username
                  Text(
                    userDetails!['email'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Error: Something went wrong maybe no"),
            );
          }
        },
      ),
    );
  }
}
