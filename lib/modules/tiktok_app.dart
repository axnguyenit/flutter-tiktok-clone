import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/global/global.dart';
import 'package:tiktok/modules/routes.dart';
import 'package:tiktok/theme/theme.dart';

class TikTokApp extends StatefulWidget {
  const TikTokApp({super.key});

  @override
  State<TikTokApp> createState() => TikTokAppState();
}

class TikTokAppState extends State<TikTokApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: Screens.splash,
      onGenerateRoute: (settings) => AppRouter().initRouter(settings),
    );
  }
}
