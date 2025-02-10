import 'package:flutter/material.dart';

import '../../../../core/utils/config/constants.dart';
import '../../../../core/utils/config/shared_widgets/build_background.dart';
import '../../auth/presentation/widgets/custom_rounded_button.dart';

class OnboardingVisionTest1 extends StatelessWidget {
  const OnboardingVisionTest1({super.key});

  static String routeName = '/vision_test1_onboarding';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          BuildBackground(size: size),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/test_vision_onboard1.png'),
                  radius: 120,
                ),
                const Spacer(flex: 1),
                Text(
                  'Ready?',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                Text(
                  '"Stand 6 meters (or 20 feet) away from the eye\n chart for an accurate vision test.The\n device will automatically detect\n the correct distance."',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                SizedBox(
                  width: size.width * .8,
                  child: CustomRoundedButton(
                      buttonName: 'Get Started',
                      press: () {
                        Navigator.pushNamed(context, '/vision_test');
                      },
                      color: kPrimaryColor,
                      textColor: Colors.white),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
