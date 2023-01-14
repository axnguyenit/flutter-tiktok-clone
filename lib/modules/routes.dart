import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import 'package:tiktok/blocs/blocs.dart';
import 'package:tiktok/constants/constants.dart';

import 'error/error_screen.dart';
import 'main/main_screen.dart';
import 'splash/splash_screen.dart';
import 'video_creation/video_creation_screen.dart';

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
          path: Screens.home.toPath,
          name: Screens.home.toName,
          builder: (context, state) => BlocProvider<AuthenticationBloc>(
            lazy: false,
            create: (context) => AuthenticationBloc.instance(),
            child: const MainScreen(),
          ),
        ),
        GoRoute(
          path: '/${Screens.videoCreation.toPath}',
          name: Screens.videoCreation.toName,
          builder: (context, state) => const VideoCreationScreen(),
        ),
      ],
      errorBuilder: (_, state) {
        log.error(state.error.toString());
        // error: state.error.toString(),
        return const ErrorScreen();
      },
    );

    return router;
  }
}
