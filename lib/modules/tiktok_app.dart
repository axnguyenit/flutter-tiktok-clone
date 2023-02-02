import 'package:common/common.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/blocs/blocs.dart';
import 'package:tiktok/global/global.dart';
import 'package:tiktok/modules/routes.dart';
import 'package:tiktok/theme/theme.dart';

class TikTokApp extends StatefulWidget {
  const TikTokApp({super.key});

  @override
  State<TikTokApp> createState() => TikTokAppState();
}

class TikTokAppState extends State<TikTokApp> {
  late final GoRouter _router;
  final _messaging = Messaging(
    firebaseMessaging: FirebaseMessaging.instance,
  );

  @override
  void initState() {
    super.initState();

    _router = AppRouter().initRouter();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      log.info(
          '*********** ${await FirebaseMessaging.instance.getToken()} ***********');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionBloc>(
          create: (_) => SessionBloc.instance()..start(),
        ),
      ],
      child: MaterialApp.router(
        theme: DefaultTheme().build(context),
        useInheritedMediaQuery: true,
        localizationsDelegates: const [
          SLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'TikTok App',
        restorationScopeId: 'TikTok App',
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale('en')],
        locale: const Locale('en'),
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      ),
    );
  }
}
