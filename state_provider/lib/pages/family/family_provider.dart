import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final familyCounterProvider = StateProvider.family<int, int>((ref, initial) {
  ref.onDispose(() => print("[familyCounterProvider($initial)] disposed"));
  return initial;
});
