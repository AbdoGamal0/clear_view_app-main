import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/models/onboard.dart';
import '../../../helpers/onboarding_manager.dart';
import '../auth/presentation/login.dart';
import 'widgets/onboarding_screen1.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  static String routeName = 'onboarding_screen';

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController controller = PageController();
  Timer? _timer;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoPageChange();
  }

  void _startAutoPageChange() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage < onboardData.length - 1) {
        currentPage++;
        controller.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _completeOnBoarding();
      }
    });
  }

  void _completeOnBoarding() async {
    _timer?.cancel();
    await OnBoardingManager.setOnBoardingSeen();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel(); // تأكد من إلغاء المؤقت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: onboardData.length,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) => OnboardingWidget(
          onboard: onboardData[index],
          controller: controller,
          totalPages: onboardData.length, // 🟢 إصلاح الخطأ بإضافة totalPages
        ),
      ),
    );
  }
}
