import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  registerUser({required String userid, required String email}) async {
    try {
      await _firestore.collection("Users").doc(userid).set({
        "userid": userid,
        "email": email,
        "running": false,
        "amount": 0,
      });
    } on FirebaseException catch (e) {
      debugPrint("Error adding user to database: $e");
    }
  }

  editRunning({
    required String userid,
    required bool running,
  }) async {
    try {
      await _firestore.collection("Users").doc(userid).update({
        "running": running,
      });
    } on FirebaseException catch (e) {
      debugPrint("Error editing user state: $e");
    }
  }
}
