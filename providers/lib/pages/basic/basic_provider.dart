import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// final helloProvider = Provider<String>((ref) {
//   return 'Hello';
// });

// final wordldProvider = Provider<String>((ref) {
//   return 'World';
// });

part 'basic_provider.g.dart';

@Riverpod(keepAlive: true)
String hello(Ref ref) {
  return 'Hello';
}

@Riverpod(keepAlive: true)
String world(Ref ref) {
  return 'World';
}
