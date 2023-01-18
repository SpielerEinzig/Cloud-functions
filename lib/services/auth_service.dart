import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return user.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("Error registering user: $e");
      return null;
    }
  }

  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return user.user;
    } on FirebaseAuthException catch (e) {
      debugPrint("Error logging user in: $e");
      return null;
    }
  }

  Future<bool> sendPasswordReset({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("Error sending password reset: $e");
      return false;
    }
  }
}
