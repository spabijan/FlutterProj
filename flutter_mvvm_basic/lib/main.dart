import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/constants/my_app_theme_data.dart';
import 'package:flutter_mvvm_basic/screens/favourite_screen.dart';
import 'package:flutter_mvvm_basic/screens/movie_details_screen.dart';
import 'package:flutter_mvvm_basic/screens/movies_screen.dart';
import 'package:flutter_mvvm_basic/utils/init_getit.dart';
import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';

void main() {
  setupLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: getIt<NavigationUtils>().navigatorKey,
        title: 'Flutter demo',
        theme: MyAppThemeData.lightTheme,
        home: MoviesScreen());
  }
}
