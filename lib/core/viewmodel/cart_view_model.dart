import 'package:flutter_firebase/core/services/database/cart_database.dart';
import 'package:flutter_firebase/model/cart_product_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  num _totalPrice = 0.0;
  num get totalPrice => _totalPrice;
  var dbHelper = CartDatabase.db;

  Future<void> addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    print("add to db");
    update();
  }

  Future<void> getAllProduct() async {
    _cartProductModel = [];
    _isLoading = true;
    _cartProductModel = await dbHelper.getAllProduct();
    getTotalPrice();
    _isLoading = false;
    update();
  }

  Future<void> increment(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += _cartProductModel[index].price!;
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  Future<void> decrement(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= _cartProductModel[index].price!;
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  void getTotalPrice() {
    _totalPrice = 0;
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice +=
          _cartProductModel[i].price! * _cartProductModel[i].quantity;
    }
    update();
  }
}
