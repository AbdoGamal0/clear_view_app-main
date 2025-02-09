import 'package:clear_view/freature/presentation/chat/presentation/chatbot.dart';
import 'package:clear_view/freature/presentation/chat/presentation/chatbot_onboarding/onboarding1_chatbot.dart';
import 'package:clear_view/freature/presentation/vision_test/onboarding_vision_test/onboarding_vision_test.dart';
import 'package:clear_view/freature/presentation/vision_test/vision_test.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../freature/presentation/auth/logic/cubit/auth_cubit.dart';
import '../../freature/presentation/auth/presentation/login.dart';
import '../../freature/presentation/auth/presentation/register.dart';
import '../../freature/presentation/auth/presentation/reset_password.dart';
import '../../freature/presentation/chat/presentation/chatbot_onboarding/onboarding_chatbot.dart';
import '../../freature/presentation/detectimage/detect_disease_page.dart';
import '../../freature/presentation/find_doctor/ListOfDoctor.dart';
import '../../freature/presentation/find_doctor/book_doctor_with_map.dart';
import '../../freature/presentation/home/home_screen.dart';
import '../../freature/presentation/main_onboarding/onboarding_screens.dart';
import '../../freature/presentation/patients/presentation/patients.dart';
import '../../freature/presentation/vision_test/onboarding_vision_test/onboarding_vision_test1.dart';
import '../../freature/presentation/vision_test/vision_test_result.dart';

class ClearView extends StatelessWidget {
  final bool hasSeenOnboarding;
  const ClearView({super.key, this.hasSeenOnboarding = false});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Clear View',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: hasSeenOnboarding ? const HomeScreen() : const OnBoarding(),
        routes: {
          OnBoarding.routeName: (context) => const OnBoarding(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          ResetPassword.routeName: (context) => const ResetPassword(),
          ChatbotOnboarding.routeName: (context) => const ChatbotOnboarding(),
          ChatbotOnboarding1.routeName: (context) => const ChatbotOnboarding1(),
          Chatbot.routeName: (context) => const Chatbot(),
          OnboardingVisionTest.routeName: (context) =>
              const OnboardingVisionTest(),
          OnboardingVisionTest1.routeName: (context) =>
              const OnboardingVisionTest1(),
          VisionTest.routeName: (context) => const VisionTest(),
          TestVisionResult.routeName: (context) => const TestVisionResult(),
          PatientsPage.routeName: (context) => const PatientsPage(),
          DetectDiseasePage.routeName: (context) => DetectDiseasePage(),
          DoctorDetailsPage.routeName: (context) => const DoctorDetailsPage(),
          DoctorsListingPage.routeName: (context) => const DoctorsListingPage(),
        },
      ),
    );
  }
}
