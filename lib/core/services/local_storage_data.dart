import 'dart:convert';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
  Future<UserModel?> get getUser async {
    try {
      UserModel? userModel = await _getUserData();
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<UserModel> _getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? value = sharedPreferences.getString(CACHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(value!));
  }

  Future<void> setUser(UserModel userModel) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(CACHED_USER_DATA, jsonEncode(userModel));
  }

  Future<void> deleteUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
