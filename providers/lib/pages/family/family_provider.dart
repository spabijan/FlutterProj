import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// final familyHelloProvider = Provider.family<String, String>((ref, name) {
//   ref.onDispose(() {
//     print('[familyHelloProvider($name)] disposed');
//   });

//   return 'Hello $name';
// });

part 'family_provider.g.dart';

@Riverpod(keepAlive: true)
String familyHello(Ref ref, String userName) {
  ref.onDispose(() {
    print('[familyHelloProvider($userName)] disposed');
  });

  return 'Hello $userName';
}
