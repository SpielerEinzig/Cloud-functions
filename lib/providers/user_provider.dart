import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_functions/models/user_model.dart';
import 'package:firebase_cloud_functions/services/auth_service.dart';
import 'package:firebase_cloud_functions/services/database_service.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final AuthService _authService = AuthService();
final DatabaseService _databaseService = DatabaseService();

UserModel _userModel = UserModel(
  running: false,
  amount: 0,
  email: "email",
  userid: "",
);

User? _userAuthCredential;

class UserProvider with ChangeNotifier {
  UserModel get getUserModel => _userModel;

  _listenUserDetails() {
    _firestore
        .collection("Users")
        .doc(_userModel.userid)
        .snapshots()
        .listen((event) {
      final json = event.data()!;

      _userModel.running = json['running'];
      _userModel.amount = json['amount'];
      _userModel.email = json['email'];
      _userModel.userid = json['userid'];
    });
  }

  registerUser({
    required String email,
    required String password,
  }) async {
    _userAuthCredential = await _authService.registerUser(
      email: email,
      password: password,
    );

    if (_userAuthCredential != null) {
      await _databaseService.registerUser(
        userid: _userAuthCredential!.uid,
        email: email,
      );

      _listenUserDetails();
    }
  }

  loginUser({
    required String email,
    required String password,
  }) async {
    _userAuthCredential = await _authService.loginUser(
      email: email,
      password: password,
    );

    if (_userAuthCredential != null) {
      await _databaseService.registerUser(
        userid: _userAuthCredential!.uid,
        email: email,
      );

      _listenUserDetails();
    }
  }
}
