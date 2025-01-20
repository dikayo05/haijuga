import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // register
  Future<UserCredential?> register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String errorMessage = 'error, try again';

    try {
      final userCredential =
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
      final userCredential = await FirebaseAuth.instance
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
}
