import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;

  UserModel({this.name, this.email});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "created_at": FieldValue.serverTimestamp(),
      "updated_at": FieldValue.serverTimestamp(),
    };
  }
}
