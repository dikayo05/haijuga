import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haijuga/pages/login_page.dart';

class AuthService {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  // register
  Future<UserCredential?> register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String errorMessage = 'error, try again';

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMessage)));

    return null;
  }

  // login
  Future<UserCredential?> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String errorMessage = 'error, try again';

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMessage)));

    return null;
  }

  // logout
  void logout(BuildContext context) async {
    await _flutterSecureStorage.delete(key: 'userCredential');
    await FirebaseAuth.instance.signOut();

    // move to login page
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  // save user credential
  void saveUserCredential(UserCredential userCredential) async {
    await _flutterSecureStorage.write(
        key: 'userCredential', value: userCredential.toString());
  }

  // check if user is logged in
  Future<bool> isLoggedIn() async {
    final String? token =
        await _flutterSecureStorage.read(key: 'userCredential');
    return token != null; // return true if token is not null
  }
}
