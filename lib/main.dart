import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:haijuga/features/auth/presentation/pages/login_page.dart';
import 'package:haijuga/themes/light_mode.dart';
import 'firebase_options.dart';

void main() async {
  // firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: LoginPage(),
    );
  }
}
