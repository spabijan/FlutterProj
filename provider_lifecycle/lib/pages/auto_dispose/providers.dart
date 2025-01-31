import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class AnotherCounter extends _$AnotherCounter {
  @override
  int build() {
    print('[anotherAutoDisposeCounterProvider] initialized');
    ref.onDispose(() => print('[anotherAutoDisposeCounterProvider] disposed'));
    ref.onCancel(() => print('[anotherAutoDisposeCounterProvider] cancelled'));
    ref.onResume(() => print('[anotherAutoDisposeCounterProvider] resumed'));
    ref.onAddListener(
        () => print('[anotherAutoDisposeCounterProvider] listener added'));
    ref.onRemoveListener(
        () => print('[anotherAutoDisposeCounterProvider] listener removed'));
    return 10;
  }

  void increment() => state += 10;
}

@riverpod
class AutoDisposeCounter extends _$AutoDisposeCounter {
  @override
  int build() {
    print('[autoDisposeCounterProvider] initialized');
    ref.onDispose(() => print('[autoDisposeCounterProvider] disposed'));
    ref.onCancel(() => print('[autoDisposeCounterProvider] cancelled'));
    ref.onResume(() => print('[autoDisposeCounterProvider] resumed'));
    ref.onAddListener(
        () => print('[autoDisposeCounterProvider] listener added'));
    ref.onRemoveListener(
        () => print('[autoDisposeCounterProvider] listener removed'));
    return 0;
  }

  void increment() => state++;
}
