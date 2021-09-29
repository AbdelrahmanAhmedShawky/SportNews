import 'package:flutter/material.dart';

class Constants {
  static String appName = "Task Ui";

  //color
   static Color lightPrimary = Color(0xfffcfcff);
   static Color darkPrimary = Colors.black;
   static Color lightAccent = Color(0xff0FB2C6);
   static Color darkAccent = Color(0xff0FB2C6);
   static Color lightBG = Color(0xfffcfcff);
   static Color darkBG = Colors.black;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
  );
}