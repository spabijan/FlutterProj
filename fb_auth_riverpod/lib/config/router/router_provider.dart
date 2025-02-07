import 'package:fb_auth_riverpod/constants/firebase_constants.dart';
import 'package:fb_auth_riverpod/pages/auth/signin/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:fb_auth_riverpod/config/router/route_names.dart';
import 'package:fb_auth_riverpod/pages/auth/reset_password/reset_password_page.dart';
import 'package:fb_auth_riverpod/pages/auth/signup/signup_page.dart';
import 'package:fb_auth_riverpod/pages/auth/verify_email/verify_email_page.dart';
import 'package:fb_auth_riverpod/pages/content/change_password/change_password_page.dart';
import 'package:fb_auth_riverpod/pages/content/home/home_page.dart';
import 'package:fb_auth_riverpod/pages/page_not_found.dart';
import 'package:fb_auth_riverpod/pages/splash/firebase_error_page.dart';
import 'package:fb_auth_riverpod/pages/splash/splash_page.dart';
import 'package:fb_auth_riverpod/repositories/auth_repository_provider.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateStreamProvider);
  return GoRouter(
      initialLocation: '/${RouteNames.splash}',
      redirect: (context, state) {
        if (authState is AsyncLoading<User?>) {
          return '/${RouteNames.splash}';
        }
        if (authState is AsyncError<User?>) {
          return '/${RouteNames.firebaseError}';
        }

        final isAuthenticated = authState.valueOrNull != null;
        final isInAuthenticationRoute =
            (state.matchedLocation == '/${RouteNames.signin}') ||
                (state.matchedLocation == '/${RouteNames.resetPassword}') ||
                (state.matchedLocation == '/${RouteNames.signup}');

        if (!isAuthenticated) {
          return isInAuthenticationRoute ? null : '/${RouteNames.signin}';
        }
        if (!FirebaseConstants.fbAuth.currentUser!.emailVerified) {
          return '/${RouteNames.verifyEmail}';
        }

        final isVerifyingEmail =
            state.matchedLocation == '/${RouteNames.verifyEmail}';
        final isSplashing = state.matchedLocation == '/${RouteNames.splash}';

        return (isInAuthenticationRoute || isVerifyingEmail || isSplashing)
            ? '/${RouteNames.home}'
            : null;
      },
      routes: [
        GoRoute(
          path: '/${RouteNames.splash}',
          name: RouteNames.splash,
          builder: (_, __) => const SplashPage(),
        ),
        GoRoute(
          path: '/${RouteNames.firebaseError}',
          name: RouteNames.firebaseError,
          builder: (_, __) => const FirebaseErrorPage(),
        ),
        GoRoute(
          path: '/${RouteNames.signin}',
          name: RouteNames.signin,
          builder: (_, __) => const SigninPage(),
        ),
        GoRoute(
          path: '/${RouteNames.signup}',
          name: RouteNames.signup,
          builder: (_, __) => const SignupPage(),
        ),
        GoRoute(
          path: '/${RouteNames.resetPassword}',
          name: RouteNames.resetPassword,
          builder: (_, __) => const ResetPasswordPage(),
        ),
        GoRoute(
          path: '/${RouteNames.verifyEmail}',
          name: RouteNames.verifyEmail,
          builder: (_, __) => const VerifyEmailPage(),
        ),
        GoRoute(
            path: '/${RouteNames.home}',
            name: RouteNames.home,
            builder: (_, __) => const HomePage(),
            routes: [
              GoRoute(
                path: '/${RouteNames.changePassword}',
                name: RouteNames.changePassword,
                builder: (_, __) => const ChangePasswordPage(),
              ),
            ])
      ],
      errorBuilder: (context, state) =>
          PageNotFound(errorMessage: state.error.toString()));
}
