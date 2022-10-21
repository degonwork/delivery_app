import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/core/viewmodel/cart_view_model.dart';
import 'package:flutter_firebase/core/viewmodel/checkout_view_model.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';
import 'package:get/state_manager.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (cartViewModel) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(
                height: 350,
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cartViewModel.cartProductModel.length,
                  itemBuilder: (context, index) => Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            cartViewModel.cartProductModel[index].image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        RichText(
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text:
                                    cartViewModel.cartProductModel[index].name!,
                                style: TextStyle(color: Colors.black))),
                        SizedBox(height: 10),
                        CustomText(
                            alignment: Alignment.bottomLeft,
                            color: primaryColor,
                            text: cartViewModel.cartProductModel[index].price!
                                .toString()),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Shipping Address",
                  fontSize: 24,
                ),
              ),
              GetBuilder<CheckoutViewModel>(
                  builder: (checkoutViewModel) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          fontSize: 24,
                          color: Colors.grey,
                          text:
                              '${checkoutViewModel.street1}, ${checkoutViewModel.street2}, ${checkoutViewModel.state}, ${checkoutViewModel.city}, ${checkoutViewModel.country}',
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
