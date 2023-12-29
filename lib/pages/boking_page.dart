import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_ocr_app/components/my_back_button.dart';
import 'package:simple_ocr_app/components/my_list_tile.dart';
import 'package:simple_ocr_app/helper/helper_functions.dart';

class BokingPage extends StatelessWidget {
  const BokingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('booking').snapshots(),
        builder: (context, snapshot) {
          // any error
          if (snapshot.hasError) {
            displayErrorMessage(context, "Error: ${snapshot.error}");
          }
          // still loading indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // if data null
          if (snapshot.data == null) {
            return const Center(
              child: Text("No data found"),
            );
          }

          // get all data booking
          final bookingAll = snapshot.data!.docs;

          return Column(
            children: [
              // back button
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 25),
                child: Row(
                  children: [
                    MyBackButton(),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // title
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Booking - List Room",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: bookingAll.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    // get individual booking data
                    final booking = bookingAll[index];

                    // get booking data from each booking
                    String name = booking['name'];
                    String nim = booking['nim'];
                    String nohp = booking['nohp'];
                    String room = booking['room'];
                    String user = booking['user'];
                    // Timestamp time = booking['time'];

                    return MyListTile(
                      title: name,
                      subTitle: nim,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
