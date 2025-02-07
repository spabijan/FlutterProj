import 'package:fb_auth_riverpod/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_provider.g.dart';

@riverpod
class ChangePassword extends _$ChangePassword {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  void changePassword(String password) async {
    state = AsyncLoading();
    final key = _key;

    final newState = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).changePassword(password));

    if (key == _key) {
      state = newState;
    }
  }
}
