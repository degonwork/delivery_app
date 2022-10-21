import 'package:flutter/material.dart';
import 'package:flutter_firebase/core/viewmodel/auth_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/cart_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/control_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/profile_view_model.dart';

import 'package:flutter_firebase/view/auth/login_view.dart';
import 'package:get/get.dart';

class ControllerView extends StatelessWidget {
  const ControllerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<AuthViewModel>().checkUser();
    return GetBuilder<AuthViewModel>(builder: (auth) {
      Get.put(ProfileViewModel(localStorageData: Get.find()));
      Get.put(CartViewModel());
      return auth.userEmail == null
          ? const LoginView()
          : GetBuilder<ControlViewModel>(builder: (controllViewModel) {
              return Scaffold(
                body: controllViewModel.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              );
            });
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(builder: (controlViewModel) {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text("Explore"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text('Cart'),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text("Account"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
        ],
        currentIndex: controlViewModel.navigatorValue,
        onTap: (index) {
          controlViewModel.changeSelectValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      );
    });
  }
}
