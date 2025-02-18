import 'package:mvvm_statemanagements/constants/my_theme_data.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider =
    NotifierProvider<ThemeNotifier, MyThemeData>(() => ThemeNotifier());

class ThemeNotifier extends Notifier<MyThemeData> {
  final prefsKey = 'isDarkMode';

  @override
  build() {
    return MyDarkThemeDate();
  }

  loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('prefsKey') ?? false;

    state = isDarkMode ? MyDarkThemeDate() : MyLightThemeData();
  }

  toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final newState = switch (state) {
      MyLightThemeData() => MyDarkThemeDate(),
      MyDarkThemeDate() => MyLightThemeData(),
    };
    prefs.setBool(prefsKey, newState.isDarkMode);
    state = newState;
  }
}
