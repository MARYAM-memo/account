import 'package:flutter/material.dart';
import 'colors.dart';

TextStyle txtStyle(Color color, double size, FontWeight weight) {
  return TextStyle(
      fontSize: size, fontWeight: weight, color: color, fontFamily: 'KANIT');
}

TextStyle getHeader({Color color = white}) {
  return txtStyle(color, 20, FontWeight.bold);
}

TextStyle getTitle({Color color = white}) {
  return txtStyle(color, 18, FontWeight.w500);
}

TextStyle getLight({Color color = white}) {
  return txtStyle(color, 16, FontWeight.w400);
}
