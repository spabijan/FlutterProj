import 'package:fb_auth_riverpod/constants/firebase_constants.dart';
import 'package:fb_auth_riverpod/repositories/handle_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  User? get currentUser => FirebaseConstants.fbAuth.currentUser;

  Future<void> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userCredential = await FirebaseConstants.fbAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final signedInUser = userCredential.user!;
      await FirebaseConstants.userCollections
          .doc(signedInUser.uid)
          .set({'name': name, 'email': email});
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }

  Future<void> signin({required String email, required String password}) async {
    try {
      await FirebaseConstants.fbAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }

  Future<void> signout() async {
    try {
      await FirebaseConstants.fbAuth.signOut();
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }

  Future<void> changePassword(String password) async {
    try {
      await currentUser!.updatePassword(password);
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }

  Future<void> setPasswordResetEmail(String email) async {
    try {
      await FirebaseConstants.fbAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await currentUser!.sendEmailVerification();
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }

  Future<void> reloadUser() async {
    try {
      await currentUser!.reload();
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }

  Future<void> reauthenticateWithCredential(
      String email, String password) async {
    try {
      await currentUser!.reauthenticateWithCredential(
          EmailAuthProvider.credential(email: email, password: password));
    } catch (e) {
      FirebaseAuthExceptionHandler.handleException(e);
    }
  }
}
