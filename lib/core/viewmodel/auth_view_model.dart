import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_firebase/core/services/firestore_user.dart';
import 'package:flutter_firebase/core/services/local_storage_data.dart';
import 'package:flutter_firebase/model/user_model.dart';
import 'package:flutter_firebase/view/controller_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final LocalStorageData localStorageData;

  User? _user;

  AuthViewModel({required this.localStorageData});
  String? get userEmail => _user?.email;

  String? email, password, name;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> checkUser() async {
    Stream<User?> userStream = auth.authStateChanges();
    await for (User? user in userStream) {
      _user = user;
      if (auth.currentUser != null) {
        getCurrentUser(auth.currentUser!.uid);
      }
      update();
    }
  }

  Future<void> googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await auth.signInWithCredential(credential).then((user) async {
      await saveUser(user);
    });
    Get.offAll(() => const ControllerView());
  }

  Future<void> facebookSigninMethod() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final accessToken = loginResult.accessToken!.token;
    if (loginResult.status == LoginStatus.success) {
      final facebookCredential = FacebookAuthProvider.credential(accessToken);

      await auth.signInWithCredential(facebookCredential).then((user) async {
        await saveUser(user);
      });
      Get.offAll(() => const ControllerView());
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await FireStoreUser().getCurrentUser(user.user!.uid).then(
              (value) => setUser(
                UserModel.fromJson(value.data() as Map<String, dynamic>),
              ),
            );
      });
      Get.offAll(() => const ControllerView());
    } catch (e) {
      Get.snackbar(
        "Error login account",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> createAccountWithEmailAndPassword() async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await saveUser(user);
      });
    } catch (e) {
      Get.snackbar(
        "Error create account",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getCurrentUser(String id) async {
    await FireStoreUser().getCurrentUser(id).then((value) => setUser(
          UserModel.fromJson(value.data() as Map<String, dynamic>),
        ));
  }

  Future<void> saveUser(UserCredential userCredential) async {
    UserModel userModel = UserModel(
      id: userCredential.user!.uid,
      email: userCredential.user!.email,
      name: name ?? userCredential.user!.displayName,
      pic: userCredential.user!.photoURL,
    );
    await FireStoreUser().addUserToFireStore(userModel);
    await setUser(userModel);
  }

  Future<void> setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
    print('set user to local');
  }
}
