import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_ocr_app/auth/login_or_register.dart';
import 'package:simple_ocr_app/pages/main_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if snapshot has data, user is logged in
          if (snapshot.hasData) {
            return const MainPage();
          } else {
            // if snapshot has no data, user is not logged in
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
