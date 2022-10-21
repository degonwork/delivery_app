import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../services/home_service.dart';

class ProductViewModel extends GetxController {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  Future<void> getBestSellingProduct() async {
    _isLoading = true;
    HomeService().getBestSellingProduct().then((value) {
      _productModel = [];

      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      print("got Product");
      _isLoading = false;
      update();
    });
  }
}
