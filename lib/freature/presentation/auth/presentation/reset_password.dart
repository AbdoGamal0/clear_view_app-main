import 'package:flutter/material.dart';

import '../../../../core/utils/config/constants.dart';
import 'widgets/custom_rounded_button.dart';
import 'widgets/custom_text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  static String routeName = '/resetPassword';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    TextEditingController emailController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Image.asset(
            'assets/images/backArrow.png',
            width: 25,
            height: 25,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefultPadding - 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: textStyle.copyWith(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              const Text(
                  'Please enter your email address to receive a link to reset your password',
                  style: TextStyle(color: kSecondaryColor, fontSize: 15)),
              SizedBox(
                height: size.height * .04,
              ),
              CustomTextField(
                controller: emailController,
                iconPath: 'assets/images/email.png',
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              const Spacer(),
              CustomRoundedButton(
                  buttonName: 'Reset Password',
                  color: kPrimaryColor,
                  textColor: kWhiteColor,
                  press: () {}),
              const Spacer(flex: 2),
            ],
          ),
        ));
  }
}
