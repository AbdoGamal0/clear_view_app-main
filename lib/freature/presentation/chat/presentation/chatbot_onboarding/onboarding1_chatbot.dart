import 'package:clear_view/core/utils/config/constants.dart';
import 'package:clear_view/freature/presentation/auth/presentation/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';

class ChatbotOnboarding1 extends StatelessWidget {
  const ChatbotOnboarding1({super.key});

  static String routeName = '/chatbot_onboarding1';

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
                  'Your Eye Health Assistant',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                Text(
                  '"I\'m here to answer all your questions about \neye diseases and symptoms. Get trusted\n medical guidance instantly."',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                CustomRoundedButton(
                  buttonName: 'Get Started',
                  press: () {
                    Navigator.pushNamed(context, '/homechatbot');
                  },
                  color: kPrimaryColor,
                  textColor: kWhiteColor,
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(Size size) {
    return Positioned(
      right: 0,
      child: Container(
        height: size.height * .5,
        width: size.width * .5,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200),
            topLeft: Radius.circular(200),
          ),
        ),
      ),
    );
  }
}
