import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // current logged user
  User? user = FirebaseAuth.instance.currentUser;

  // rooms from firestore
  final CollectionReference roomsCollection =
      FirebaseFirestore.instance.collection("rooms");

  // get collection of booking from firestore
  final CollectionReference bookingCollection =
      FirebaseFirestore.instance.collection("booking");

  // boking a data to firestore
  Future<void> addbooking(String name, String nim, String nohp, String room) {
    // create the booking
    return bookingCollection.add({
      'user':
          user!.email, // 'user' is the field name, 'user!.email' is the value
      'name': name,
      'nim': nim,
      'nohp': nohp,
      'room': room,
      'Time': DateTime.now(),
    });
  }

  // read all booking data from firestore
  Stream<QuerySnapshot> readBooking() {
    return bookingCollection.snapshots();
  }
}
