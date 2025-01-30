import 'dart:async';
import "package:riverpod_annotation/riverpod_annotation.dart";

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  FutureOr<int> build(int initialValue) async {
    ref.onDispose(
      () => print('[counterProvider] disposed'),
    );
    waitSecond();
    return initialValue;
  }

  Future<void> increment() async {
    state = await AsyncValue.guard(
      () async {
        await waitSecond();
        if (state.value! == 2) {
          throw 'Fail to increment';
        }
        return state.value! + 1;
      },
    );
  }

  Future<void> decrement() async {
    state = await AsyncValue.guard(
      () async {
        await waitSecond();
        return state.value! - 1;
      },
    );
  }

  Future<void> waitSecond() => Future.delayed(const Duration(seconds: 1));
}
