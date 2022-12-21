import 'package:eye_do/data/models/app_theme.dart';
import 'package:eye_do/ui/res/text_style.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeData({required AppTheme theme}) {
  return ThemeData(
    colorScheme: ColorScheme.light(primary: theme.mainColor),
    primaryColor: theme.mainColor,
    secondaryHeaderColor: theme.secondColor,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    backgroundColor: AppColor.backgroundColor,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      titleTextStyle: headline1.copyWith(color: AppColor.labelPrimary),
      backgroundColor: AppColor.backgroundColor,
      iconTheme: const IconThemeData(
        color: AppColor.labelPrimary,
      ),
    ),
    textTheme: TextTheme(
      headline1: headline1,
      headline2: headline2,
      headline3: headline3,
      bodyText1: textBody1.copyWith(color: AppColor.labelTertiary),
      bodyText2: textBody2.copyWith(color: AppColor.labelPrimary),
      subtitle1: subtitle1.copyWith(color: AppColor.labelPrimary),
      subtitle2: subtitle1.copyWith(color: Colors.black54),
      button: button,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) => 0.0),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) => button.copyWith(color: AppColor.backgroundColor),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) => const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.whiteColor.withOpacity(0.5);
            }
            return AppColor.whiteColor;
          },
        ),
      ),
    ),
  );
}
