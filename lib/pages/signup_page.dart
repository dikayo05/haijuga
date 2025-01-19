import 'package:flutter/material.dart';
import '../services/firebase/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('data'),
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
                onPressed: () => _authService.signup(
                    email: _emailController.text,
                    password: _passwordController.text),
                child: const Text('Register'))
          ],
        ),
      ),
    );
  }
}
