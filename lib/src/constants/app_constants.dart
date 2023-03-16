import 'package:flutter/material.dart';

class AppConstants {
  static const localizationAssetPath = 'assets/translations';
  static const listLanguageSupport = [
    Locale('vi'),
    Locale('en'),
  ];
  static const defaultModel = 'text-davinci-003';
  static const defaultMaxTokens = 300;
  static const defaultTemperature = 0.0;

  static const String fourK = '4K';
  static const String keyValueIconOne = 'icon1';
  static const String keyValueIconTwo = 'icon2';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class ImageConstants {
  static const userDefaultImage = 'assets/images/user.png';
  static const appLogo = 'assets/images/logo.png';
  static const defaultBackground = 'assets/images/default_background.png';
}

class DimensionConstants {
  static const double size_0 = 0;
  static const double size_0DOT12 = 0.12;
  static const double size_0DOT15 = 0.15;
  static const double size_0DOT25 = 0.25;
  static const double size_0DOT35 = 0.35;
  static const double size_0DOT4 = 0.4;
  static const double size_0DOT6 = 0.6;
  static const double size_0DOT7 = 0.7;
  static const double size_0DOT75 = 0.75;
  static const double size_0DOT8 = 0.8;
  static const double size_0DOT85 = 0.85;
  static const double size_1 = 1;
  static const double size_2 = 2;
  static const double size_4 = 4;
  static const double size_7 = 7;
  static const double size_8 = 8;
  static const double size_10 = 10;
  static const double size_14 = 14;
  static const double size_15 = 15;
  static const double size_16 = 16;
  static const double size_18 = 18;
  static const double size_20 = 20;
  static const double size_28 = 28;
  static const double size_32 = 32;
  static const double size_35 = 35;
  static const double size_36 = 36;
  static const double size_44 = 44;
  static const double size_48 = 48;
  static const double size_50 = 50;
  static const double size_52 = 52;
  static const double size_60 = 60;
  static const double size_70 = 70;
  static const double size_80 = 80;
  static const double size_100 = 100;
  static const double size_400 = 400;

  static const double radius_24 = 24;
  static const double radius_36 = 36;
  static const double radius_40 = 40;
  static const double radius_250 = 250;

  static const double elevation_15 = 15;

  static const double responsiveBreakPointMobile = 240;
  static const double responsiveBreakPointTablet = 650;
  static const double responsiveBreakPointDesktop = 1000;
  static const double responsiveBreakPoint4k = 2468;

  static const int durationMilliseconds_300 = 300;
  static const double rotationTransitionOffset_1 = 1;
  static const double rotationTransitionOffset_0 = 0;
  static const double offset_0 = 0;

  static const int maxLine_4 = 4;

  static const double opacity_0DOT8 = 0.8;
}

class FirestoreConstants {
  static const pathUserCollection = 'users';
  static const pathMessageCollection = 'messages';
  static const photoUrl = 'photoUrl';
  static const id = 'id';
  static const chatWithGPT = 'chatWithGPT';
  static const timestamp = 'timestamp';
  static const content = 'content';
  static const botSender = 'bot';
}
