import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userColectionRef =
      FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userColectionRef.doc(userModel.id).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String id) async {
    return await _userColectionRef.doc(id).get();
  }
}
