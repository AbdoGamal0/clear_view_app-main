import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingManager {
  static const String _key = 'seen_onboarding';

  static Future<void> setOnBoardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }

  static Future<bool> hasSeenOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}
