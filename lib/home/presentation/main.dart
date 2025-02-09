import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../helpers/onboarding_manager.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool hasSeenOnboarding = await OnBoardingManager.hasSeenOnBoarding();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: true,
      builder: (context) => ClearView(
            hasSeenOnboarding: hasSeenOnboarding,
          )));
}
