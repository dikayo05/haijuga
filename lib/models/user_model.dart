import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? email;

  UserModel({this.name, this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'created_at': FieldValue.serverTimestamp(),
    };
  }
}
