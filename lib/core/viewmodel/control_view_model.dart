import 'package:flutter/material.dart';
import 'package:flutter_firebase/core/viewmodel/cart_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/profile_view_model.dart';
import 'package:get/get.dart';
import '../../view/cart_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = const HomeView();
  Widget get currentScreen => _currentScreen;

  int _navigatorValue = 0;

  int get navigatorValue => _navigatorValue;
  void changeSelectValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = const HomeView();
        break;

      case 1:
        _currentScreen = const CartView();
        Get.find<CartViewModel>().getAllProduct();
        break;

      case 2:
        _currentScreen = const ProfileView();
        Get.find<ProfileViewModel>().getCurrentuser();
        break;
    }
    update();
  }
}
