import 'package:flutter/material.dart';
import 'package:go_riverpod/config/router/auth_state_provider.dart';
import 'package:go_riverpod/config/router/route_names.dart';
import 'package:go_riverpod/pages/first_details_page.dart';
import 'package:go_riverpod/pages/first_page.dart';
import 'package:go_riverpod/pages/page_not_found.dart';
import 'package:go_riverpod/pages/scaffold_with_navbar.dart';
import 'package:go_riverpod/pages/second_details_page.dart';
import 'package:go_riverpod/pages/second_page.dart';
import 'package:go_riverpod/pages/signin_page.dart';
import 'package:go_riverpod/pages/signup_page.dart';
import 'package:go_riverpod/pages/third_details_page.dart';
import 'package:go_riverpod/pages/third_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(Ref ref) {
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/first',
    redirect: (context, state) {
      final authenticated = authState;
      final tryingSignin = state.matchedLocation == '/signin';
      final tryingSignup = state.matchedLocation == '/signup';
      final authenticating = tryingSignin || tryingSignup;

      if (!authenticated) return authenticating ? null : '/signin';
      if (authenticating) return '/first';
      return null;
    },
    routes: [
      GoRoute(
        path: '/signin',
        name: RouteNames.signin,
        builder: (context, state) {
          return const SigninPage();
        },
      ),
      GoRoute(
          path: '/signup',
          name: RouteNames.signup,
          builder: (context, state) {
            return const SignupPage();
          }),
      StatefulShellRoute.indexedStack(
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/first',
                  name: RouteNames.first,
                  builder: (context, state) => FirstPage()),
              GoRoute(
                  path: '/details',
                  name: RouteNames.firstDetails,
                  builder: (context, state) => FirstDetailsPage())
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/second',
                  name: RouteNames.second,
                  builder: (context, state) => SecondPage(),
                  routes: [
                    GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: 'details/:id',
                        name: RouteNames.secondDetails,
                        builder: (context, state) {
                          final id = state.pathParameters['id']!;
                          return SecondDetailsPage(id: id);
                        })
                  ]),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/third',
                  name: RouteNames.third,
                  builder: (context, state) => ThirdPage(),
                  routes: [
                    GoRoute(
                      path: 'details/:id',
                      name: RouteNames.thirdDetails,
                      builder: (context, state) {
                        final id = state.pathParameters['id']!;
                        final firstName =
                            state.uri.queryParameters['firstname'] ??
                                'Anonymous';
                        final lastName =
                            state.uri.queryParameters['lastName'] ??
                                'Anonymous';

                        return ThirdDetailsPage(
                            id: id, firstName: firstName, lastName: lastName);
                      },
                    )
                  ])
            ]),
          ],
          builder: (context, state, navigationShell) =>
              ScaffoldWithNavBar(navigationShell: navigationShell))
    ],
    errorBuilder: (context, state) =>
        PageNotFound(errMsg: state.error.toString()),
  );
}
