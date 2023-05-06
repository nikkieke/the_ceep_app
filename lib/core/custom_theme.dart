import 'package:flutter/material.dart';

ThemeData customLightTheme() {

  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    primaryColor: const Color(0xff73009E),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: Color(0xffFAF9F6),
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: Colors.white,
      size: 20,
    ),
    iconTheme: lightTheme.iconTheme.copyWith(
      color: const Color(0xff73009E),
    ),
    backgroundColor: Colors.white,
    buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: const Color(0xff73009E)),
    errorColor: Colors.red, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFFF8E1)),
  );
}


ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    scaffoldBackgroundColor: Color(0xff121212),
    textTheme: ThemeData.dark().textTheme,
    primaryColor: const Color(0xff73009E),
    indicatorColor: const Color(0xFF807A6B),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: const Color(0xff73009E),
      size: 20,
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFFF8E1)),
  );
}