import 'package:flutter/material.dart';

import '../../../../../core/utils/config/constants.dart';

// ignore: must_be_immutable
class CustomPasswordField extends StatelessWidget {
  CustomPasswordField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller});
  final String hintText;
  final String labelText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Image.asset('assets/images/password-outline.png'),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            )),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            )),
        hintText: hintText,
        label: Text(
          labelText,
          style: textStyle.copyWith(fontSize: 15, color: kSecondaryColor),
        ),
        fillColor: kPrimaryColor,
      ),
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: kPrimaryColor),
    );
  }
}
