import 'package:flutter/material.dart';

// firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haijuga/services/firebase/auth_service.dart';
import 'package:haijuga/services/firebase/firestore_service.dart';

import 'package:haijuga/models/user_model.dart';

// page
import 'main_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signup'),
      ),
      body: Center(
        child: Column(
          children: [
            // name input
            TextField(
              decoration: InputDecoration(hintText: 'Name'),
              controller: _nameController,
            ),

            // email input
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: _emailController,
            ),

            // password input
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
              controller: _passwordController,
            ),
            ElevatedButton(
                onPressed: () async {
                  // authentication
                  final UserCredential? userCredential =
                      await _authService.register(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);

                  // if has credential, save credential and move to home page
                  if (userCredential != null) {
                    try {
                      _authService.saveUserCredential(userCredential);

                      // save user data to firestore
                      final UserModel userModel = UserModel(
                        name: _nameController.text,
                        email: _emailController.text,
                      );

                      await _firestoreService.addUserModel(
                        userCredential.user!.uid,
                        userModel,
                      );

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const MainPage()),
                      );
                    } catch (e) {
                      // Handle the exception, e.g., show a snackbar or log the error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to save user data: $e')),
                      );
                    }
                  }
                },
                child: const Text('Register')),

            // button to login page
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage())),
              child: const Text('have account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
