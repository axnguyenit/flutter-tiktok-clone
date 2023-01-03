import 'package:flutter/material.dart';
import 'package:tiktok/global/global.dart';

import 'app_colors.dart';

extension AppContext on BuildContext {
  // XThemeExtension get color => Theme.of(this).extension<XThemeExtension>()!;

  String translate(
    String key, {
    String suffix = '',
    List<dynamic>? params = const [],
    bool checkNumberParams = false,
  }) {
    return S.of(this).translate(
          key,
          suffix: suffix,
          params: params,
          checkNumberParams: checkNumberParams,
        );
  }

  ThemeData get theme => Theme.of(this);

  TextStyle? get displayLarge => theme.textTheme.displayLarge;

  TextStyle? get displayMedium => theme.textTheme.displayMedium;

  TextStyle? get displaySmall => theme.textTheme.displaySmall;

  TextStyle? get headlineLarge => theme.textTheme.headlineLarge;

  TextStyle? get headlineMedium => theme.textTheme.headlineMedium;

  TextStyle? get headlineSmall => theme.textTheme.headlineSmall;

  TextStyle? get titleLarge => theme.textTheme.titleLarge;

  TextStyle? get titleMedium => theme.textTheme.titleMedium;

  TextStyle? get titleSmall => theme.textTheme.titleSmall;

  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;

  TextStyle? get bodyMedium => theme.textTheme.bodyMedium;

  TextStyle? get bodySmall => theme.textTheme.bodySmall;

  TextStyle? get labelLarge => theme.textTheme.labelLarge;

  TextStyle? get labelMedium => theme.textTheme.labelMedium;

  TextStyle? get labelSmall => theme.textTheme.labelSmall;

  // *********** COLORS *********** //
  Color get lightColor => AppColors.light;

  Color get darkColor => AppColors.dark;

  Color get textColor => AppColors.text;

  Color get aquaColor => AppColors.aqua;

  Color get backgroundSubduedColor => AppColors.backgroundSubdued;

  Color get primaryColor => AppColors.primaryColor;

  Color get borderColor => AppColors.border;

  Color get borderHoverColor => AppColors.borderHover;

  Color get borderActiveColor => AppColors.borderActive;

  Color get borderDisableColor => AppColors.borderDisable;

  Color get placeholderColor => AppColors.placeholder;

  Color get foregroundSubduedColor => AppColors.foregroundSubdued;

  Color get dangerColor => AppColors.danger;

  Color get dangerSubduedColor => AppColors.dangerSubdued;

  Color get dangerHoverColor => AppColors.dangerHover;

  Color get successColor => AppColors.success;

  Color get successSubduedColor => AppColors.successSubdued;

  Color get successHoverColor => AppColors.successHover;

  Color get warningColor => AppColors.warning;

  Color get warningSubduedColor => AppColors.warningSubdued;

  Color get warningHoverColor => AppColors.warningHover;

  Color get iconColor => AppColors.icon;
}
