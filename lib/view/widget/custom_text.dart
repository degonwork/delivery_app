import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.overflow = TextOverflow.clip,
    this.height = 1,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final TextOverflow overflow;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          height: height,
        ),
        overflow: overflow,
      ),
    );
  }
}
