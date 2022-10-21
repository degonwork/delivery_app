import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/core/viewmodel/category_view_model.dart';
import 'package:flutter_firebase/view/detail_view.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';
import 'package:get/get.dart';

import '../core/viewmodel/product_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryViewModel>().getCategory();
    Get.find<ProductViewModel>().getBestSellingProduct();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchTextFormField(),
              const SizedBox(height: 30),
              const CustomText(
                text: "Categories",
              ),
              const SizedBox(height: 30),
              _listViewCategories(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(text: "Best Selling", fontSize: 18),
                  CustomText(text: "See all", fontSize: 18),
                ],
              ),
              const SizedBox(height: 30),
              _listViewProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategories() {
    return GetBuilder<CategoryViewModel>(builder: (categoryViewmodel) {
      return categoryViewmodel.isLoading
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 100,
              child: ListView.separated(
                itemCount: categoryViewmodel.categoryModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                        ),
                        height: 60,
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              categoryViewmodel.categoryModel[index].image!),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                          text: categoryViewmodel.categoryModel[index].name!),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20),
              ),
            );
    });
  }

  Widget _listViewProduct() {
    return GetBuilder<ProductViewModel>(builder: (productViewModel) {
      return productViewModel.isLoading
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 350,
              child: ListView.separated(
                itemCount: productViewModel.productModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailView(
                          model: productViewModel.productModel[index]));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade100,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                              height: 220,
                              child: Image.network(
                                productViewModel.productModel[index].image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomText(
                            text: productViewModel.productModel[index].name!,
                            alignment: Alignment.bottomLeft,
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            text: productViewModel
                                .productModel[index].decription!,
                            color: Colors.grey,
                            alignment: Alignment.bottomLeft,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 20),
                          CustomText(
                            text:
                                "${productViewModel.productModel[index].price!}  \$",
                            color: primaryColor,
                            alignment: Alignment.bottomLeft,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20),
              ),
            );
    });
  }
}
