import 'package:flutter/material.dart';

sealed class MyThemeData {
  ThemeData get theme;
  bool get isDarkMode;
  IconData get icon;
}

final class MyLightThemeData extends MyThemeData {
  @override
  ThemeData get theme => lightTheme;

  final ThemeData lightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1),
      colorScheme: const ColorScheme.light(
        surface: Color.fromARGB(26, 13, 184, 247),
      ));

  @override
  bool get isDarkMode => false;

  @override
  IconData get icon => Icons.light_mode;
}

final class MyDarkThemeDate extends MyThemeData {
  @override
  ThemeData get theme => darkTheme;

  final ThemeData darkTheme = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade800,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      colorScheme: const ColorScheme.dark());

  @override
  bool get isDarkMode => true;

  @override
  IconData get icon => Icons.dark_mode;
}
