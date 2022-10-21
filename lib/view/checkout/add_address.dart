import 'package:flutter/material.dart';
import 'package:flutter_firebase/core/viewmodel/checkout_view_model.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';
import 'package:flutter_firebase/view/widget/custom_text_form_field.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CheckoutViewModel>(
        builder: (checkoutViewModel) => Form(
          key: checkoutViewModel.formState,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  CustomText(
                    text: 'Billing address is the same as delivery address',
                    fontSize: 20,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    text: 'Street 1',
                    hintText: '21, Alex Davidson Avenue',
                    onSave: (String value) {
                      checkoutViewModel.street1 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "You must write your Street";
                      }
                    },
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    text: 'Street 2',
                    hintText: 'Opposite Omegatron, Vicent Quarters',
                    onSave: (String value) {
                      checkoutViewModel.street2 = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "You must write your Street";
                      }
                    },
                  ),
                  SizedBox(height: 40),
                  CustomTextFormField(
                    text: 'City',
                    hintText: 'Victoria Island',
                    onSave: (String value) {
                      checkoutViewModel.city = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "You must write your City";
                      }
                    },
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomTextFormField(
                              text: 'State',
                              hintText: 'Lagos State',
                              onSave: (String value) {
                                checkoutViewModel.state = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "You must write your State";
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextFormField(
                              text: 'Country',
                              hintText: 'Nigeria',
                              onSave: (String value) {
                                checkoutViewModel.country = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "You must write your Country";
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
