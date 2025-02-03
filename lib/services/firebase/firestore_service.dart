import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haijuga/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String id, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(id).set(data);
  }

  // Add this method to convert UserModel to a map and save it to Firestore
  Future<void> addUserModel(String id, UserModel userModel) async {
    await addUser(id, userModel.toMap());
  }
}
