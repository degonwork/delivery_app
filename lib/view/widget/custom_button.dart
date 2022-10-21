import 'package:flutter/material.dart';

import '../../constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
  });
  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: textColor,
        ),
      ),
    );
  }
}
