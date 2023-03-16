import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor primaryColor = MaterialColor(_appColorPrimaryValue, <int, Color>{
    50: Color(0xFFFDE7EC),
    100: Color(0xFFFBC2D0),
    200: Color(0xFFF89AB1),
    300: Color(0xFFF57192),
    400: Color(0xFFF3527A),
    500: Color(_appColorPrimaryValue),
    600: Color(0xFFEF2F5B),
    700: Color(0xFFED2751),
    800: Color(0xFFEB2147),
    900: Color(0xFFE71535),
  });
  static const int _appColorPrimaryValue = 0xFFF13463;

  static const MaterialColor appColorAccent = MaterialColor(_appColorAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_appColorAccentValue),
    400: Color(0xFFFFB0BA),
    700: Color(0xFFFF96A4),
  });
  static const int _appColorAccentValue = 0xFFFFE3E7;

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color textBlackColor = Color(0xFF151C26);
  static const Color secondaryColor = Color(0xFF5B5867);
  static const Color textBlurColor = Color(0xFFADABB7);
  static const Color backgroundMessageScreenColor = Color(0xFFF6F5F9);
  static const Color textButtonColor = Color(0xFF919EC4);
  static const Color errorTextColor = Color(0xFFE52727);
  static const Color loadingBlurColor = Color(0x1F000000);
  static const Color profileBlurColor = Color(0xFF3A3E4C);
  static const Color dividerColor = Color(0xFFD8D8D8);
}