import 'package:flutter/material.dart';

abstract class BaseTheme {
  ColorScheme get colorScheme => const ColorScheme.light();

  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.primary,
        surfaceTintColor: colorScheme.primary,
        toolbarTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      );

  String get fontFamily => 'Gilroy';

  ThemeData build(BuildContext context) {
    final bool isDark = colorScheme.brightness == Brightness.dark;

    final Color primarySurfaceColor =
        isDark ? colorScheme.surface : colorScheme.primary;

    final Color onPrimarySurfaceColor =
        isDark ? colorScheme.onSurface : colorScheme.onPrimary;

    return ThemeData(
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      primaryColor: primarySurfaceColor,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      indicatorColor: onPrimarySurfaceColor,
      errorColor: colorScheme.error,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w400),
        displayMedium: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
        displaySmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
        headlineLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),

        // *********** EDIT TEXT STYLE *********** //
        titleMedium: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
        titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
        bodyLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),

        // *********** BUTTON STYLE *********** //
        labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ).apply(
        bodyColor: const Color(0xFF3A4A64),
        displayColor: const Color(0xFF3A4A64),
      ),
      applyElevationOverlayColor: isDark,
      useMaterial3: true,
      appBarTheme: appBarTheme,
      iconTheme: const IconThemeData(color: Color(0xFF8992A2)),
      disabledColor: const Color(0XFFC4C4CA),
    );
  }
}
