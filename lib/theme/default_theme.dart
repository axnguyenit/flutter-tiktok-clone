import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';

import 'base_theme.dart';

class DefaultTheme extends BaseTheme {
  final int _primaryColor = 0xFFFF0050; // Pink

  @override
  ColorScheme get colorScheme {
    final primaryColorSwatch = MaterialColor(
      _primaryColor,
      <int, Color>{
        500: AppColors.primaryColor,
        700: AppColors.primaryColor.withBlue(40),
      },
    );

    return ColorScheme.fromSwatch(
      primarySwatch: primaryColorSwatch,
      primaryColorDark: AppColors.primaryColor.withBlue(40),
      accentColor: AppColors.aqua,
      cardColor: AppColors.light,
      backgroundColor: AppColors.light,
      errorColor: AppColors.danger,
    ).copyWith(
      onBackground: AppColors.backgroundSubdued,
      tertiary: AppColors.border,
    );
  }
}
