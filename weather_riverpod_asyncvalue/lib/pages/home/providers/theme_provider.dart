import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_riverpod_asyncvalue/pages/home/providers/theme_state.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeState build() {
    return const LightTheme();
  }

  void changeTheme(ThemeState newTheme) {
    if (state != newTheme) state = newTheme;
  }
}
