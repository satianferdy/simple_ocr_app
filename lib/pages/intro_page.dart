import 'package:flutter/material.dart';
import 'package:simple_ocr_app/auth/auth.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text
              const Text(
                'Anda bingung ingin meminjam ruang kelas tapi harus pinjam ke siapa?',
                style: TextStyle(
                  color: Color.fromRGBO(24, 16, 89, 1),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'assets/images/splash.png',
                  height: 263,
                ),
              ),

              const SizedBox(height: 12),

              // text logo
              Image.asset(
                'assets/images/text.png',
                height: 32,
              ),

              // const Text(
              //   'Find Work',
              //   style: TextStyle(
              //     color: Color.fromRGBO(24, 16, 89, 1),
              //     fontSize: 24,
              //     fontWeight: FontWeight.w900,
              //   ),
              // ),

              const SizedBox(height: 32),

              // subtitle app
              const Opacity(
                opacity: 0.5,
                child: Text(
                  'Membantu anda untuk mencari dan meminjam ruangan kelas dengan mudah  dalam waktu dekat.',
                  style: TextStyle(
                    color: Color.fromRGBO(24, 16, 89, 1),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 48),

              // start button
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(24, 16, 89, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
