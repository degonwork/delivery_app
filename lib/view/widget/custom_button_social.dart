import 'package:flutter/material.dart';
import 'package:flutter_firebase/view/widget/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {super.key,
      required this.text,
      required this.imageName,
      required this.onPressed});
  final String text;
  final String imageName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function(),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(imageName),
            const SizedBox(width: 90),
            CustomText(
              text: text,
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
