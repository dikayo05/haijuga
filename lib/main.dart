import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:haijuga/app.dart';
import 'firebase_options.dart';

void main() async {
  // firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}