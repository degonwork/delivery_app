import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/core/services/local_storage_data.dart';
import 'package:flutter_firebase/model/user_model.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  ProfileViewModel({required this.localStorageData});

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
    print("Log out");
  }

  Future<void> getCurrentuser() async {
    _isLoading = true;
    await localStorageData.getUser.then((user) {
      if (user != null) {
        _userModel = user;
        print(_userModel!.name);
      } else {
        return null;
      }
      _isLoading = false;
      update();
    });
  }
}
