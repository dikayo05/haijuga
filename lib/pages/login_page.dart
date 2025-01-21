import 'package:flutter/material.dart';

// firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haijuga/services/firebase/auth_service.dart';

// page
import 'main_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _emailController,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
            ),
            ElevatedButton(
                onPressed: () async {
                  // authentication
                  final UserCredential? userCredential =
                      await _authService.login(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);

                  // if has credential, save credential and move to home page
                  if (userCredential != null) {
                    _authService.saveUserCredential(userCredential);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  }
                },
                child: const Text('Login')),
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage())),
              child: const Text("don't have account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
