import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sync_provider_for_async_apis/main.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final currentValue = preferences.getInt('counter') ?? 0;
    ref.listenSelf((previous, next) {
      preferences.setInt('counter', next);
    });
    return currentValue;
  }

  void increment() {
    state++;
  }
}
