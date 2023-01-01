import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';

import 'authentication/sign_in/sign_in_screen.dart';
import 'error/error_screen.dart';
import 'home/home_screen.dart';
import 'splash/splash_screen.dart';

class AppRouter {
  static final _singleton = AppRouter._internal();

  factory AppRouter() => _singleton;

  AppRouter._internal();

  Route<dynamic> initRouter(RouteSettings settings) {
    switch (settings.name) {
      case Screens.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Screens.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Screens.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const ErrorScreen();
          },
        );
    }
  }
}
