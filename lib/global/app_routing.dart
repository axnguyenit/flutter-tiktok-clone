import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final AppRouting _singleton = AppRouting._internal();

  factory AppRouting() {
    return _singleton;
  }

  AppRouting._internal();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  NavigatorState? get navigator => _navigatorKey.currentState;

  void go(BuildContext context, String name) {
    GoRouter.of(context).go(name);
  }

  void goNamed(BuildContext context, String name) {
    GoRouter.of(context).goNamed(name);
  }

  void push(BuildContext context, String name) {
    GoRouter.of(context).push(name);
  }

  void pushNamed(BuildContext context, String name) {
    GoRouter.of(context).pushNamed(name);
  }

  void pushReplacement(BuildContext context, String name) {
    GoRouter.of(context).pushReplacement(name);
  }

  void pushReplacementNamed(BuildContext context, String name) {
    GoRouter.of(context).pushReplacementNamed(name);
  }

  void pop<T extends Object>(BuildContext context, [T? result]) {
    GoRouter.of(context).pop<T>(result);
  }
}
