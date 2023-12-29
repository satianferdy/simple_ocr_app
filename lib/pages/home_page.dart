import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_ocr_app/components/my_rooms_box.dart';
import 'package:simple_ocr_app/helper/my_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // firebase auth instance
  // final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.lightGrey,
      body: Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          //message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'everyone flies... some fly longer than others🚀',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),

          // avaliable rooms
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rooms❤️‍🔥',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // rooms box
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('rooms').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // get all data rooms
              final rooms = snapshot.data!.docs;

              if (snapshot.data == null || rooms.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text('No rooms found... fill something!'),
                  ),
                );
              }

              // return list view rooms
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    // get individual room data
                    final room = rooms[index];

                    // get rooms data from each rooms
                    String name = room['name'];
                    String type = room['type'];

                    return MyRoomsBox(
                      title: name,
                      subTitle: type,
                    );
                  },
                  itemCount: rooms.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
