/*

LOGIN PAGE

on this page, an existing user can login with their:
- email
- password

--------------------------------------------------------------------

once the user successfully login, they will be redirected to home page.

if user doesn't have an account yet, they can go to register page from here to create account.

*/

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // SCAFFOLD
    return Scaffold(
      // BODY
      body: SafeArea(child: Column(
        children: [
          Icon(Icons.lock_open_rounded, size: 80, color: Theme.of(context).colorScheme.primary)
        ],
      )),
    );
  }
}