import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant.dart';
import 'package:flutter_firebase/helper/enum.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 50),
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: const CustomText(
              text: 'Standard Delivery',
              fontSize: 24,
            ),
            subtitle: const CustomText(
              text: '\nOrder will be delivered between 3 - 5 business days',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
          const SizedBox(height: 50),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: const CustomText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: const CustomText(
              text:
                  '\nPlace your order before 6pm and your items will be delivered the next day',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),
          const SizedBox(height: 50),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: const CustomText(
              text: 'Nominated Delivery',
              fontSize: 24,
            ),
            subtitle: const CustomText(
              text:
                  '\nPick a particular date from the calendar and order will be delivered on selected date',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          )
        ],
      ),
    );
  }
}
