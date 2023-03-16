import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'app_color.dart';

mixin AppTheme {
  static ThemeData buildTheme() => ThemeData(
        primarySwatch: AppColor.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColor.primaryColor),
        scaffoldBackgroundColor: AppColor.whiteColor,
        appBarTheme: const AppBarTheme(
          elevation: DimensionConstants.size_0,
          backgroundColor: AppColor.whiteColor,
          iconTheme: IconThemeData(
            color: AppColor.secondaryColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll<double>(DimensionConstants.size_0),
            backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor), //button color
            foregroundColor: MaterialStateProperty.all<Color>(AppColor.whiteColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DimensionConstants.radius_40),
              ),
            ),
          ),
        ),

        outlinedButtonTheme: const OutlinedButtonThemeData(),
        textButtonTheme: const TextButtonThemeData(),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          fillColor: AppColor.whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DimensionConstants.radius_40),
            borderSide: const BorderSide(color: AppColor.whiteColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DimensionConstants.radius_40),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DimensionConstants.radius_40),
            borderSide: const BorderSide(color: AppColor.whiteColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DimensionConstants.radius_40),
            borderSide: const BorderSide(color: AppColor.whiteColor),
          ),
          errorMaxLines: 1,
        ),
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: DimensionConstants.size_36,
            color: AppColor.textBlackColor,
          ),
          bodyMedium: TextStyle(
            fontSize: DimensionConstants.size_16,
            color: AppColor.textBlackColor,
          ),
          bodySmall: TextStyle(
            fontSize: DimensionConstants.size_14,
            color: AppColor.textBlurColor,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: TextStyle(
            fontSize: DimensionConstants.size_20,
            fontWeight: FontWeight.w600,
          ),
          labelMedium: TextStyle(
            fontSize: DimensionConstants.size_16,
            color: AppColor.textBlackColor,
          ),
          labelSmall: TextStyle(
            fontSize: DimensionConstants.size_14,
            color: AppColor.textButtonColor,
          ),
          titleMedium: TextStyle(
            fontSize: DimensionConstants.size_16,
            color: AppColor.textBlackColor,
          ),
        ),
      );
}

extension CustomTextTheme on TextTheme {
  TextStyle get appBarTitle => const TextStyle(
      fontSize: DimensionConstants.size_36,
      color: AppColor.textBlackColor,
      fontWeight: FontWeight.w600,
  );

  TextStyle get appTextLabelLarge => const TextStyle(
      color: AppColor.whiteColor,
      fontSize: DimensionConstants.size_20,
      fontWeight: FontWeight.w600,
  );
 TextStyle get appTextLabelMedium => const TextStyle(
      color: AppColor.whiteColor,
      fontSize: DimensionConstants.size_16,
  );
}