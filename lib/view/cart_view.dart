import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/core/viewmodel/cart_view_model.dart';
import 'package:flutter_firebase/view/checkout/checkout_view.dart';
import 'package:flutter_firebase/view/widget/custom_button.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartViewModel());
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<CartViewModel>(
        builder: (cartViewModel) => cartViewModel.cartProductModel.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/cart_empty.svg',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  const CustomText(
                    text: 'Cart Empty',
                    fontSize: 32,
                    alignment: Alignment.center,
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: cartViewModel.cartProductModel.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              height: 140,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 140,
                                    child: Image.network(
                                      cartViewModel
                                          .cartProductModel[index].image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: cartViewModel
                                            .cartProductModel[index].name!,
                                      ),
                                      const SizedBox(height: 6),
                                      CustomText(
                                        text:
                                            '\$ ${cartViewModel.cartProductModel[index].price}',
                                        color: primaryColor,
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        width: 140,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  cartViewModel
                                                      .increment(index);
                                                },
                                                child: const Icon(Icons.add,
                                                    color: Colors.black)),
                                            const SizedBox(width: 20),
                                            CustomText(
                                              text: cartViewModel
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              alignment: Alignment.center,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 20),
                                            GestureDetector(
                                              onTap: () {
                                                cartViewModel.decrement(index);
                                              },
                                              child: const Icon(Icons.remove,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const CustomText(
                                  text: "TOTAL",
                                  fontSize: 22,
                                  color: Colors.grey),
                              const SizedBox(height: 15),
                              GetBuilder<CartViewModel>(
                                builder: (cartViewModel) => CustomText(
                                  text:
                                      "\$  ${cartViewModel.totalPrice.toStringAsFixed(2)}",
                                  fontSize: 18,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 180,
                            padding: const EdgeInsets.all(20),
                            child: CustomButton(
                              textColor: Colors.white,
                              color: primaryColor,
                              onPressed: () {
                                Get.to(() => const CheckoutView());
                              },
                              text: "Check out",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    ));
  }
}
