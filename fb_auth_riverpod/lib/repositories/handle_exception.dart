import 'package:fb_auth_riverpod/models/custom_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class FirebaseAuthExceptionHandler {
  FirebaseAuthExceptionHandler._();

  static CustomError handleException(e) {
    try {
      throw e;
    } on FirebaseAuthException catch (e) {
      return CustomError(
        code: e.code,
        message: e.message ?? 'Invalid credential',
        plugin: e.plugin,
      );
    } on FirebaseException catch (e) {
      return CustomError(
        code: e.code,
        message: e.message ?? 'Firebase Error',
        plugin: e.plugin,
      );
    } catch (e) {
      return CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'Unknow error',
      );
    }
  }
}
