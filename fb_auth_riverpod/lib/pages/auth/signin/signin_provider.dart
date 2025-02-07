import 'package:fb_auth_riverpod/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_provider.g.dart';

@riverpod
class Signin extends _$Signin {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  void signin({required String email, required String password}) async {
    state = const AsyncLoading();
    final key = _key;

    final newState = await AsyncValue.guard(() => ref
        .read(authRepositoryProvider)
        .signin(email: email, password: password));

    if (key == _key) {
      state = newState;
    }
  }
}
