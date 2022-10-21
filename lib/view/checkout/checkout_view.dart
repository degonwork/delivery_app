import 'package:flutter/material.dart';
import 'package:flutter_firebase/core/viewmodel/checkout_view_model.dart';
import 'package:flutter_firebase/view/checkout/add_address.dart';
import 'package:flutter_firebase/view/checkout/delevery_time.dart';
import 'package:flutter_firebase/view/checkout/summary.dart';
import 'package:flutter_firebase/view/controller_view.dart';
import 'package:flutter_firebase/view/widget/custom_button.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import '../../constant.dart';
import '../../helper/enum.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    Pages pages = Pages.DeliveryTime;
    return GetBuilder<CheckoutViewModel>(
      builder: (checkoutViewModel) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: checkoutViewModel.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= checkoutViewModel.index) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == checkoutViewModel.index) {
                        final prevColor = checkoutViewModel.getColor(index - 1);
                        final color = checkoutViewModel.getColor(index);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: checkoutViewModel.getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
            checkoutViewModel.pages == Pages.DeliveryTime
                ? DeliveryTime()
                : checkoutViewModel.pages == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: [
                    checkoutViewModel.index == 0
                        ? Container(
                            width: 200,
                            height: 100,
                          )
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              width: 200,
                              height: 100,
                              child: CustomButton(
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  text: 'Back',
                                  onPressed: () {
                                    checkoutViewModel.changeIndex(
                                        checkoutViewModel.index - 1);
                                  }),
                            ),
                          ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: 200,
                        height: 100,
                        child: CustomButton(
                            textColor: Colors.white,
                            color: primaryColor,
                            text: 'Next',
                            onPressed: () {
                              checkoutViewModel
                                  .changeIndex(checkoutViewModel.index + 1);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final _processes = ["Delivery", "Address", "Summer"];
