import 'package:flutter/material.dart';

TextStyle _text = const TextStyle(
  fontFamily: 'Montserrat',
);

TextStyle headline1 = _text.copyWith(
  fontSize: 40.0,
  fontWeight: FontWeight.w700,
);

TextStyle headline2 = _text.copyWith(
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  height: 24 / 18,
);

TextStyle headline3 = _text.copyWith(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  height: 18 / 14,
);

TextStyle textBody1 = _text.copyWith(
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
  height: 18 / 14,
);

TextStyle textBody2 = _text.copyWith(
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
  height: 18 / 14,
);

TextStyle button = _text.copyWith(
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.3,
  height: 18 / 14,
);

TextStyle subtitle1 = _text.copyWith(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  height: 18 / 14,
);
