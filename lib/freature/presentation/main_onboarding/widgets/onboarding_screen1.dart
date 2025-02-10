import 'package:flutter/material.dart';
import '../../../../core/models/onboard.dart';
import '../../../../core/utils/config/constants.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboard,
    required this.controller,
    required this.totalPages,
  });

  final Onboard onboard;
  final PageController controller;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  controller.jumpToPage(totalPages - 1); // الانتقال إلى آخر صفحة
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
              Image.asset(
                'assets/images/EyeLogo.png',
                width: 50,
                height: 50,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Image.asset(
            onboard.image,
            width: 250,
            height: 250,
          ),
          const SizedBox(height: 20),
          Text(
            onboard.headline,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff407BFF),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            onboard.desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff407BFF),
            ),
          ),
          const Spacer(),

          // 🟢 استبدال SmoothPageIndicator بمؤشر بسيط باستخدام Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? kPrimaryColor : Colors.grey, // الصفحة الحالية بلون مختلف
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

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
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Get Started'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
