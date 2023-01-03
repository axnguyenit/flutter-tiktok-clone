import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import 'package:tiktok/blocs/blocs.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/modules/authentication/sign_in/sign_in_screen.dart';
import 'package:tiktok/modules/main/main_screen.dart';
import 'package:tiktok/modules/splash/splash_screen.dart';

import 'error/error_screen.dart';

class AppRouter {
  static final _singleton = AppRouter._internal();
  late final GoRouter _router;

  factory AppRouter() => _singleton;

  AppRouter._internal();

  GoRouter get router => _router;

  GoRouter initRouter([List<NavigatorObserver>? observers]) {
    _router = GoRouter(
      debugLogDiagnostics: !kReleaseMode,
      observers: observers,
      initialLocation: '/${Screens.splash.toPath}',
      routes: <GoRoute>[
        GoRoute(
          path: '/${Screens.splash.toPath}',
          name: Screens.splash.toName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/${Screens.signIn.toPath}',
          name: Screens.signIn.toName,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: Screens.home.toPath,
          name: Screens.home.toName,
          builder: (_, __) => BlocProvider(
            lazy: false,
            create: (_) => AuthenticationBloc.instance(),
            child: const MainScreen(),
          ),
        ),
      ],
      errorBuilder: (_, state) {
        log.error(state.error);
        // error: state.error.toString(),
        return const ErrorScreen();
      },
    );

    return router;
  }
}
