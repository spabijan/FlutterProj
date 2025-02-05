import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_riverpod_asyncvalue/pages/temp_settings/providers/temp_settings_state.dart';

part 'temp_settings_provider.g.dart';

@Riverpod(keepAlive: true)
class TempSettings extends _$TempSettings {
  @override
  TempSettingsState build() {
    return Celsius();
  }

  void toogleTempUnit() {
    state = switch (state) {
      Celsius() => Fahrenheit(),
      Fahrenheit() => Celsius(),
    };
  }
}
