import 'package:flutter/material.dart';

class RiveAppTheme {
  static bool isDarkMode = false; // تحديد الوضع الافتراضي (مبدئيًا Light Mode)

  // ألوان ديناميكية بناءً على الوضع الحالي
  static Color get accentColor => const Color(0xFF5E9EFF);
  static Color get shadow => isDarkMode ? shadowDark : const Color(0xFF4A5367);
  static Color get shadowDark => const Color(0xFF000000);
  static Color get background => isDarkMode ? backgroundDark : const Color(0xFFF2F6FF);
  static Color get backgroundDark => const Color(0xFF020D3A);
  static Color get background2 => isDarkMode ? backgroundDark : const Color(
      0xFF97B1F5);




  // ألوان النصوص
  static Color get primaryText => isDarkMode ? Colors.white : Colors.black;
  static Color get secondaryText => isDarkMode ? Colors.white70 : Colors.black54;
}
