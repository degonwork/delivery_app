import 'package:flutter_firebase/core/services/local_storage_data.dart';
import 'package:flutter_firebase/core/viewmodel/auth_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/cart_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/category_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/checkout_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/control_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/product_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/profile_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => AuthViewModel(localStorageData: Get.find()));
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => CategoryViewModel());
    Get.lazyPut(() => ProductViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => ProfileViewModel(localStorageData: Get.find()));
    Get.lazyPut(() => CheckoutViewModel());
  }
}
