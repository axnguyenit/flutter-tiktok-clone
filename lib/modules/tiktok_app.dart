import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
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
  @override
  void initState() {
    super.initState();

    _router = AppRouter().initRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
