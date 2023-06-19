import 'package:flutter/material.dart';
import 'package:quotes/core/utils/colors/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: primary,
    hintColor: hint,
    highlightColor: orange,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    textTheme: const TextTheme(
      // button: const TextStyle(
      //   fontSize: 16,
      //   fontFamily: AppStrings.fontFamily,
      //   color: Colors.black,
      //   fontWeight: FontWeight.w500,
      // ),
      bodyMedium: TextStyle(
        height: 1.3,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
