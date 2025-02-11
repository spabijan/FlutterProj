import 'package:flutter/material.dart';

class NavigationUtils {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationUtils() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  dynamic navigate(Widget widget) {
    return navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => widget));
  }

  dynamic navigateReplace(Widget widget) {
    return navigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  dynamic showDialog(Widget widget, {BuildContext? context}) async {
    await showAdaptiveDialog(
        context: context ?? navigatorKey.currentContext!,
        builder: (context) => widget);
  }

  dynamic showSnackbar(Widget snackBarBody, {BuildContext? context}) {
    final context = navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

    final snackBar = SnackBar(
      content: snackBarBody,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
