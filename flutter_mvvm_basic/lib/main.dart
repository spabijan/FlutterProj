import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/constants/my_app_theme_data.dart';
import 'package:flutter_mvvm_basic/screens/favourite_screen.dart';
import 'package:flutter_mvvm_basic/screens/movie_details_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter demo',
        theme: MyAppThemeData.lightTheme,
        home: MovieDetailsScreen());
  }
}
