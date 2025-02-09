import 'package:flutter/material.dart';

import '../../../../../core/utils/config/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.iconPath});
  final String hintText;
  final String labelText;
  final String? iconPath;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Image.asset(iconPath ?? 'assets/images/user-light.png'),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          hintText: hintText,
          label: Text(
            labelText,
            style: textStyle.copyWith(fontSize: 15, color: kSecondaryColor),
          ),
          fillColor: kPrimaryColor),
      style: const TextStyle(
        color: kPrimaryColor,
      ),
    );
  }
}
