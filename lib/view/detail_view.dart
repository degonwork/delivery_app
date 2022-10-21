import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/core/viewmodel/cart_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/control_view_model.dart';
import 'package:flutter_firebase/model/cart_product_model.dart';
import 'package:flutter_firebase/view/controller_view.dart';
import 'package:flutter_firebase/view/widget/custom_button.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.model}) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    Get.put(ControlViewModel());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Image.network(
                      model.image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          CustomText(
                            text: model.name!,
                            fontSize: 26,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const CustomText(
                                      text: 'Size',
                                    ),
                                    CustomText(
                                      text: model.size!,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const CustomText(
                                      text: 'Color',
                                    ),
                                    Container(
                                      width: 30,
                                      height: 20,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: model.color),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const CustomText(
                            text: "Details",
                            fontSize: 18,
                          ),
                          const SizedBox(height: 20),
                          CustomText(
                            text: model.decription!,
                            fontSize: 18,
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const CustomText(
                            text: "PRICE",
                            fontSize: 22,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: "\$  ${model.price!}",
                            color: primaryColor,
                            fontSize: 18,
                          )
                        ],
                      ),
                      GetBuilder<CartViewModel>(builder: (cartviewModel) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          width: 180,
                          height: 100,
                          child: CustomButton(
                            textColor: Colors.white,
                            color: primaryColor,
                            onPressed: () {
                              cartviewModel.addProduct(
                                CartProductModel(
                                  name: model.name,
                                  image: model.image,
                                  price: model.price,
                                  quantity: 1,
                                  productId: model.id,
                                ),
                              );

                              Get.to(() => const ControllerView());
                            },
                            text: "Add",
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 25,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ControllerView());
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40 / 2),
                      color: const Color(0xfffcf4e4)),
                  child: const Icon(Icons.arrow_back_ios,
                      color: Color(0xff756d54), size: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
