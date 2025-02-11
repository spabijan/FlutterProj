import 'package:flutter/material.dart';

class MyAppThemeData {
  static final lightTheme = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1),
      colorScheme:
          ColorScheme.light(surface: Color.fromARGB(26, 13, 184, 247)));

  static final darkTheme = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade800,
          foregroundColor: Colors.white,
          elevation: 1),
      colorScheme: ColorScheme.dark());
}
