import 'package:fb_auth_riverpod/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_provider.g.dart';

@riverpod
class ResetPassword extends _$ResetPassword {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  void resetPassword({required String email}) async {
    state = AsyncLoading();
    final key = _key;

    final newState = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).setPasswordResetEmail(email));

    if (key == _key) {
      state = newState;
    }
  }
}
