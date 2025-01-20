import 'package:flutter/material.dart';

// firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haijuga/services/firebase/auth_service.dart';

// page
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: Text('signup'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _emailController,
            ),
            TextField(
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

                  // move to home page if has have credential
                  if (userCredential != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                child: const Text('Register')),
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
