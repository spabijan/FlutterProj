import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/model/user.dart';
import 'package:future_provider/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_providers.g.dart';

@riverpod
FutureOr<List<User>> userList(Ref ref) async {
  ref.onDispose(() => print('[userListProvider] disposed'));
  final response = await ref.watch(dioProvider).get('/users');
  final List userList = response.data;
  final users = [for (final user in userList) User.fromJson(user)];
  return users;
}

@riverpod
FutureOr<User> userDetail(Ref ref, int id) async {
  ref.onDispose(() => print('[userDetailProvider($id)] disposed'));
  final response = await ref.watch(dioProvider).get('/users/$id');
  ref.keepAlive();
  final user = User.fromJson(response.data);
  return user;
}

// final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
//   ref.onDispose(() => print('[userListProvider] disposed'));
//   final response = await ref.watch(dioProvider).get('/users');
//   final List userList = response.data;
//   final users = [for (final user in userList) User.fromJson(user)];
//   return users;
// });

// final userDetailProvider = FutureProvider.family<User, int>((ref, id) async {
//   ref.onDispose(() => print('[userDetailProvider($id)] disposed'));
//   final response = await ref.watch(dioProvider).get('/users/$id');
//   final user = User.fromJson(response.data);
//   return user;
// });
