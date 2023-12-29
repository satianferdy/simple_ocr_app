import 'package:flutter/material.dart';
import 'package:simple_ocr_app/database/firestore.dart';
import 'package:simple_ocr_app/components/my_button.dart';
import 'package:simple_ocr_app/components/my_textfield.dart';

class FormPage extends StatefulWidget {
  final void Function()? onTab;

  const FormPage({super.key, required this.onTab});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // firestore database instance
  final FirestoreDatabase database = FirestoreDatabase();

  // text editing controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController roomController = TextEditingController();

  // boking method
  void boking() {
    // cek apakah semua field sudah terisi
    if (nameController.text.isNotEmpty &&
        nimController.text.isNotEmpty &&
        nohpController.text.isNotEmpty &&
        roomController.text.isNotEmpty) {
      // create the booking
      String name = nameController.text;
      String nim = nimController.text;
      String nohp = nohpController.text;
      String room = roomController.text;
      database.addbooking(
        name,
        nim,
        nohp,
        room,
      );
    }

    // clear all textfield
    nameController.clear();
    nimController.clear();
    nohpController.clear();
    roomController.clear();

    // route to boking page
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // app name
              Image.asset(
                'assets/images/text.png',
                height: 32,
              ),

              // text form title
              const SizedBox(height: 25),

              const Text(
                'Form Booking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              // username textfield
              MyTextField(
                hintText: "ex: Jarot",
                obscureText: false,
                controller: nameController,
              ),

              const SizedBox(height: 10),

              // email textfield
              MyTextField(
                hintText: "ex: 2141720001",
                obscureText: false,
                controller: nimController,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                hintText: "ex: 081234567890",
                obscureText: false,
                controller: nohpController,
              ),

              const SizedBox(height: 10),

              // Room textfield
              MyTextField(
                hintText: "ex: Ruang Teori 1",
                obscureText: false,
                controller: roomController,
              ),

              const SizedBox(height: 25),

              // booking button
              MyButton(
                text: 'Boking Now',
                onTap: boking,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
