import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_samples/freature/presentation/auth/presentation/widgets/custom_rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utils/config/constants.dart';
import '../../../../helpers/show_snake_bar.dart';
import '../../home/home_screen.dart';
import '../logic/cubit/auth_cubit.dart';
import 'reset_password.dart';
import 'widgets/already_have_an_account_check.dart';
import 'widgets/custom_password_field.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/or_divider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // print('Current State: ${state.runtimeType}');
          if (state is AuthSuccess) {
            Navigator.pushNamed(context, HomeScreen.routeName);
          } else if (state is AuthFailure) {
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) => ModalProgressHUD(
          inAsyncCall: state is AuthLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefultPadding,
              vertical: kDefultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListView(shrinkWrap: true),
                Image.asset(
                  klEyeLogo,
                  width: size.width,
                  height: size.height * .12,
                  fit: BoxFit.fitHeight,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                CustomTextField(
                  hintText: 'Enter your Name',
                  labelText: 'Full Name',
                  controller: nameController,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                CustomTextField(
                  hintText: 'Enter your Email',
                  labelText: 'Email',
                  iconPath: 'assets/images/email.png',
                  controller: emailController,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                CustomPasswordField(
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                  controller: passwordController,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                CustomPasswordField(
                  hintText: 'Re-Enter your Password',
                  labelText: 'ConfirmPassword',
                  controller: passwordController,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ResetPassword.routeName);
                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(color: kPrimaryColor),
                    )),
                SizedBox(
                  height: size.height * .03,
                ),
                CustomRoundedButton(
                    buttonName: 'sign up',
                    press: () {
                      BlocProvider.of<AuthCubit>(context).register(
                          emailController.text, passwordController.text);
                    },
                    color: kPrimaryColor,
                    textColor: kWhiteColor),
                const Align(
                  alignment: Alignment.center,
                  child: OrDivider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(kGoogleLogo),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(kFacebookLogo),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
