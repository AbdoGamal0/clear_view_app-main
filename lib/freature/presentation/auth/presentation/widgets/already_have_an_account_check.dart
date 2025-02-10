import 'package:flutter/material.dart';

import '../../../../../core/utils/config/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  const AlreadyHaveAnAccountCheck({super.key, required this.login, this.press});
  final bool login;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // 'Don\'t have an account? ',
          login ? 'don\'t have an account? ' : 'already have an account? ',
          style: const TextStyle(color: kPrimaryColor, fontSize: 15),
        ),
        InkWell(
          onTap: press,
          child: Text(
            // 'Sign Up',
            login ? 'Signup' : 'Login',
            style: const TextStyle(
              color: Color(0xff1706FF),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
