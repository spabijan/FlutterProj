import 'package:fb_auth_riverpod/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  void signup(
      {required String name,
      required String password,
      required String email}) async {
    state = AsyncLoading();
    final key = _key;

    final newState = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .signup(name: name, email: email, password: password),
    );

    if (key == _key) {
      state = newState;
    }
  }
}
