import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.buttonName,
    required this.press,
    required this.color,
    required this.textColor,
  });
  final String buttonName;
  final VoidCallback? press;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            color,
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsetsDirectional.symmetric(
              vertical: 22,
            ),
          ),
        ),
        onPressed: press,
        child: Text(
          buttonName,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
