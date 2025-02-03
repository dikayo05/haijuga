import 'package:flutter/material.dart';
import 'package:haijuga/pages/login_page.dart';
import 'package:haijuga/pages/main_page.dart';

import 'package:haijuga/services/firebase/auth_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    final AuthService authService = AuthService();

    authService.isLoggedIn().then((loggedIn) {
      if (loggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('haijuga'),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
