import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_family_provider.g.dart';

@riverpod
String autodisposeFamilyHello(Ref ref, String there) {
  ref.onDispose(() {
    print('[autodisposeFamilyHelloProvider($there)] disposed');
  });

  return 'Hello $there';
}

class Counter extends Equatable {
  final int count;

  const Counter({required this.count});

  @override
  String toString() => 'Counter(count: $count)';

  @override
  List<Object> get props => [count];
}

// final counterProvider = Provider.autoDispose.family<int, Counter>((ref, c) {
//   ref.onDispose(() {
//     print('[counterProvider($c)] disposed');
//   });
//   return c.count;
// });

// final autoDisposeFamilyHelloProvider =
//     Provider.autoDispose.family<String, String>((ref, name) {
//   ref.onDispose(() {
//     print('[autodisposeFamilyHelloProvider($name)] disposed');
//   });

//   return 'Hello $name';
// });
