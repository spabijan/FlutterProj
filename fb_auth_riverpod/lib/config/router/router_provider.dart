import 'package:fb_auth_riverpod/config/router/route_names.dart';
import 'package:fb_auth_riverpod/pages/auth/reset_password/reset_password_page.dart';
import 'package:fb_auth_riverpod/pages/auth/signin/signin_page.dart';
import 'package:fb_auth_riverpod/pages/auth/signup/signup_page.dart';
import 'package:fb_auth_riverpod/pages/auth/verify_email/verify_email_page.dart';
import 'package:fb_auth_riverpod/pages/content/change_password/change_password_page.dart';
import 'package:fb_auth_riverpod/pages/content/home/home_page.dart';
import 'package:fb_auth_riverpod/pages/page_not_found.dart';
import 'package:fb_auth_riverpod/pages/splash/firebase_error_page.dart';
import 'package:fb_auth_riverpod/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
      initialLocation: '/splash',
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
