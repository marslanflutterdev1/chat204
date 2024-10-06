import 'package:flutter/material.dart';

class CustomUtils {
  static TextStyle customTextStyle({
    Color? color = Colors.blue,
    double? fontSize = 20,
    FontWeight? fontWeight = FontWeight.normal,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }
}
