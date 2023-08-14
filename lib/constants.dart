import 'package:flutter/material.dart';

TextStyle textStyle(String font, double fontSize, fontWeight, double lettersSpacing, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: font,
    letterSpacing: lettersSpacing,
    color: color,
  );
}
