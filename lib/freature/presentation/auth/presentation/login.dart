import 'package:clear_view/freature/presentation/auth/logic/cubit/auth_cubit.dart';
import 'package:clear_view/helpers/show_snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utils/config/constants.dart';
import '../../home/home_screen.dart';
import 'register.dart';
import 'reset_password.dart';
import 'widgets/already_have_an_account_check.dart';
import 'widgets/custom_password_field.dart';
import 'widgets/custom_rounded_button.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/or_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final size = MediaQuery.sizeOf(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // print('Current State: ${state.runtimeType}'); // ✅ طباعة الحالة

          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else if (state is AuthFailure) {
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AuthLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefultPadding,
                vertical: kDefultPadding,
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(flex: 1),
                    Image.asset(
                      klEyeLogo,
                      width: size.width,
                      height: size.height * .12,
                      fit: BoxFit.fitHeight,
                    ),
                    const Spacer(flex: 2),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .06),
                    CustomTextField(
                      hintText: 'Enter your Email',
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: size.height * .03),
                    CustomPasswordField(
                      hintText: 'Enter your Password',
                      labelText: 'Password',
                      controller: passwordController,
                    ),
                    SizedBox(height: size.height * .01),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ResetPassword.routeName);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                    SizedBox(height: size.height * .05),
                    CustomRoundedButton(
                      buttonName: 'Sign In',
                      press: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        } else {}

                        BlocProvider.of<AuthCubit>(context).login(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      color: kPrimaryColor,
                      textColor: kWhiteColor,
                    ),
                    const Spacer(flex: 1),
                    const Align(
                        alignment: Alignment.center, child: OrDivider()),
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
                    const Spacer(flex: 3),
                    AlreadyHaveAnAccountCheck(
                      login: true,
                      press: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RegisterScreen.routeName,
                        );
                      },
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
