import 'package:clear_view/core/models/onboard.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/config/constants.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboard,
    required this.controller, // Add controller as a required parameter
  });

  // static const routeName = '/onboarding_screen1';
  final Onboard onboard;
  final PageController controller; // Declare the controller

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text('Skip', style: TextStyle(color: kPrimaryColor)),
            ),
            Image.asset('assets/images/EyeLogo.png'),
          ],
        ),
        Image.asset(
          onboard.image,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 10),
        Text(
          onboard.headline,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 50,
            color: Color(0xff407BFF),
          ),
        ),
        const Spacer(flex: 1),
        Text(
          onboard.desc,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff407BFF),
          ),
        ),
        const Spacer(flex: 2),
        SmoothPageIndicator(
          controller: controller,
          count: onboardData.length,
          effect: const WormEffect(
            spacing: 10,
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: kPrimaryColor,
          ),
          onDotClicked: (index) => controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          ),
        ),
        const Spacer(flex: 2),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor)),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Get Started'),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
