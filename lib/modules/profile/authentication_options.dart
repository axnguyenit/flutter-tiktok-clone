import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

enum AuthenticationOptions {
  phoneOrEmail,
  facebook,
  google,
  twitter,
  line,
  kakaoTalk,
  phoneOrEmailOrUsername,
  instagram;

  String get toTitle {
    switch (this) {
      case AuthenticationOptions.phoneOrEmail:
        return Strings.Authentication.phoneOrEmail;
      case AuthenticationOptions.facebook:
        return Strings.Authentication.facebook;
      case AuthenticationOptions.google:
        return Strings.Authentication.google;
      case AuthenticationOptions.twitter:
        return Strings.Authentication.twitter;
      case AuthenticationOptions.line:
        return Strings.Authentication.line;
      case AuthenticationOptions.kakaoTalk:
        return Strings.Authentication.kakaoTalk;
      case AuthenticationOptions.phoneOrEmailOrUsername:
        return Strings.Authentication.phoneOrEmailOrUsername;
      case AuthenticationOptions.instagram:
        return Strings.Authentication.instagram;
    }
  }

  Widget get toIcon {
    switch (this) {
      case AuthenticationOptions.phoneOrEmail:
        return const Icon(
          Icons.person,
          size: 24,
          color: AppColors.light,
        );
      case AuthenticationOptions.facebook:
        return const AppIcon(
          icon: AppIcons.facebook,
          height: 24,
          width: 24,
        );
      case AuthenticationOptions.google:
        return const AppIcon(
          icon: AppIcons.google,
          height: 24,
          width: 24,
        );
      case AuthenticationOptions.twitter:
        return const AppIcon(
          icon: AppIcons.twitter,
          height: 24,
          width: 24,
        );
      case AuthenticationOptions.line:
        return const AppIcon(
          icon: AppIcons.line,
          height: 24,
          width: 24,
        );
      case AuthenticationOptions.kakaoTalk:
        return const AppIcon(
          icon: AppIcons.kakaotalk,
          height: 24,
          width: 24,
        );
      case AuthenticationOptions.phoneOrEmailOrUsername:
        return const Icon(Icons.person_outline);
      case AuthenticationOptions.instagram:
        return const AppIcon(
          icon: AppIcons.instagram,
          height: 24,
          width: 24,
        );
    }
  }
}

enum AuthenticationType {
  signUp,
  signIn;

  List<AuthenticationOptions> get authenticationOptions {
    switch (this) {
      case AuthenticationType.signUp:
        return [
          AuthenticationOptions.phoneOrEmail,
          AuthenticationOptions.facebook,
          AuthenticationOptions.google,
          AuthenticationOptions.twitter,
          AuthenticationOptions.line,
          AuthenticationOptions.kakaoTalk,
        ];
      case AuthenticationType.signIn:
        return [
          AuthenticationOptions.phoneOrEmailOrUsername,
          AuthenticationOptions.facebook,
          AuthenticationOptions.google,
          AuthenticationOptions.twitter,
          AuthenticationOptions.line,
          AuthenticationOptions.kakaoTalk,
          AuthenticationOptions.instagram,
        ];
    }
  }
}
