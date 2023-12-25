import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_ocr_app/firebase_options.dart';
import 'package:simple_ocr_app/pages/intro_page.dart';
import 'package:simple_ocr_app/pages/main_page.dart';
import 'package:simple_ocr_app/auth/login_or_register.dart';
import 'package:simple_ocr_app/pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/login_or_register': (context) => const LoginOrRegister(),
        '/home_page': (context) => const MainPage(),
        '/profile_page': (context) => const ProfilePage(),
      },
    );
  }
}
