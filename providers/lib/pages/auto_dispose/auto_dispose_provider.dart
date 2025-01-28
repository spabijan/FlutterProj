import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// final audoDisposeHelloProvider = AutoDisposeProvider<String>((ref) {
//   print('[audoDisposeHelloProvider] created');
//   ref.onDispose(() => print('[audoDisposeHelloProvider] disposed'));
//   return 'Hello';
// });

part 'auto_dispose_provider.g.dart';

@riverpod
String autoDisposeHello(Ref ref) {
  print('[audoDisposeHelloProvider] created');
  ref.onDispose(() => print('[audoDisposeHelloProvider] disposed'));
  return 'Hello';
}
