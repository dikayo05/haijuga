import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String id, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(id).set(data);
  }
}
