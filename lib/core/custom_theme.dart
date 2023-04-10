import 'package:flutter/material.dart';

ThemeData customLightTheme() {

  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    primaryColor: Color(0xff73009E),
    indicatorColor: Color(0xFF807A6B),
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: Colors.white,
      size: 20,
    ),
    iconTheme: lightTheme.iconTheme.copyWith(
      color: Color(0xff73009E),
    ),
    backgroundColor: Colors.white,
    buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Color(0xff73009E)),
    errorColor: Colors.red, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFF8E1)),
  );
}


ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    primaryColor: Color(0xff73009E),
    indicatorColor: Color(0xFF807A6B),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: Color(0xff73009E),
      size: 20,
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFF8E1)),
  );
}