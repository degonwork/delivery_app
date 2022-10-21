import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.hintText,
      required this.onSave,
      required this.validator});
  final String text;
  final String hintText;
  final Function onSave;
  final Function validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: onSave as void Function(String?)?,
          validator: validator as String? Function(String?)?,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
