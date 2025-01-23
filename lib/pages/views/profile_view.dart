import 'package:flutter/material.dart';
import 'package:haijuga/services/firebase/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Profile'),
        Text(FirebaseAuth.instance.currentUser!.email!),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('do you want to logout?'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () => _authService.logout(context),
                          child: const Text('Ok')),
                    ],
                  );
                });
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
