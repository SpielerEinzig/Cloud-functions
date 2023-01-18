import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_functions/services/auth_service.dart';
import 'package:firebase_cloud_functions/services/database_service.dart';
import 'package:flutter/material.dart';

final AuthService _authService = AuthService();
final DatabaseService _databaseService = DatabaseService();

User? _userAuthCredential;

class UserProvider with ChangeNotifier {
  User? get getUserCredential => _userAuthCredential;

  Future registerUser({
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

      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    _userAuthCredential = await _authService.loginUser(
      email: email,
      password: password,
    );

    if (_userAuthCredential != null) {
      return true;
    } else {
      return false;
    }
  }
}
