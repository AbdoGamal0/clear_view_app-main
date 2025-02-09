import 'package:clear_view/core/utils/config/constants.dart';
import 'package:clear_view/freature/presentation/auth/presentation/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';

import '../chatbot.dart';

class ChatbotOnboarding extends StatelessWidget {
  const ChatbotOnboarding({super.key});

  static String routeName = '/chatbot_onboarding';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(size),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 50, vertical: kDefultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/chatbot.png'),
                  radius: 120,
                ),
                const Spacer(flex: 2),
                Text(
                  'Medication Information',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                Text(
                  '"Learn about your prescribed medications\nand how to use them properly.\nFollow medical advice for the best care."',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                _buildButton(
                  buttonName: 'Get Started',
                  color: kPrimaryColor,
                  textColor: kWhiteColor,
                  onPress: () {
                    // completeOnboarding(context, const Chatbot());
                    Navigator.pushNamed(context, Chatbot.routeName);
                  },
                ),
                const Spacer(flex: 1),
                _buildButton(
                  buttonName: 'Next',
                  color: Colors.transparent,
                  textColor: kBlackColor,
                  onPress: () {
                    Navigator.pushNamed(context, '/chatbot_onboarding1');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(Size size) {
    return Positioned(
      left: 0,
      child: Container(
        height: size.height * .5,
        width: size.width * .5,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(200),
            topRight: Radius.circular(200),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String buttonName,
    required Color color,
    required Color textColor,
    required VoidCallback onPress,
  }) {
    return CustomRoundedButton(
      buttonName: buttonName,
      press: onPress,
      color: color,
      textColor: textColor,
    );
  }
}
