import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Rubik',
  primaryColor: Color(0xFF6A41C2),
  primaryColorLight: Color(0xFF95BCCB),
  primaryColorDark: Color(0xFF3F769A),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFF2C2C2C),
  accentColor: Color(0xFF252525),
  hintColor: Color(0xFFE7F6F8),
  focusColor: Color(0xFFADC4C8),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: Colors.white,
    textStyle: TextStyle(color: Colors.white),
  )),
  textTheme: TextTheme(
    button: TextStyle(color: Color(0xFF252525)),
    subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    bodyText2: TextStyle(fontSize: 12.0),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);
