import 'package:flutter/material.dart';

import '../../../../core/utils/config/constants.dart';
import '../../../../core/utils/config/shared_widgets/build_background.dart';
import '../../auth/presentation/widgets/custom_rounded_button.dart';
import 'onboarding_vision_test1.dart';

class OnboardingVisionTest extends StatelessWidget {
  const OnboardingVisionTest({super.key});

  static String routeName = '/vision_test0_onboarding';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BuildBackground(size: size),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/test_vision_onboard.png'),
                  radius: 120,
                ),
                const Spacer(flex: 1),
                Text(
                  'check your sight in few minutes',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                Text(
                  '"Learn about your prescribed medications\nand how to use them properly.Follow .\nmedical advice for the best care."',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                SizedBox(
                  width: size.width * .8,
                  child: CustomRoundedButton(
                      buttonName: 'Next',
                      press: () {
                        Navigator.pushNamed(
                            context, OnboardingVisionTest1.routeName);
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
