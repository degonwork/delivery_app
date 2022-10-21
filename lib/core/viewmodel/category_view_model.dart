import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../services/home_service.dart';

class CategoryViewModel extends GetxController {
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  Future<void> getCategory() async {
    _isLoading = true;
    HomeService().getCategory().then((value) {
      _categoryModel = [];

      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      print("got Category");
      _isLoading = false;
      update();
    });
  }
}
