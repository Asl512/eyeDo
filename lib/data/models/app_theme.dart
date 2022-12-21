import 'package:flutter/material.dart';

class AppTheme {
  final ThemeName name;
  final Color mainColor;
  final Color secondColor;

  AppTheme({
    required this.name,
    required this.mainColor,
    required this.secondColor,
  });
}

enum ThemeName {
  green,
  blue,
  brown,
}

final appThemeGreen = AppTheme(
  name: ThemeName.green,
  mainColor: const Color(0XFF517A46),
  secondColor: const Color(0XFF8B5057),
);

final appThemeBlue = AppTheme(
  name: ThemeName.blue,
  mainColor: const Color(0XFF3A749D),
  secondColor: const Color(0XFFF5AD50),
);

final appThemeBrown = AppTheme(
  name: ThemeName.brown,
  mainColor: const Color(0XFF9B7048),
  secondColor: const Color(0XFF3F92D2),
);

final appThemes = [
  appThemeBrown,
  appThemeGreen,
  appThemeBlue,
];
