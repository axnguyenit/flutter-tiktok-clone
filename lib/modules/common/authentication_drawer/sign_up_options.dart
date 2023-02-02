import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/blocs/blocs.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

import 'authentication_options.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({super.key});

  List<Widget> _buildSignUpOptions(BuildContext context) {
    final signUpOptions = <Widget>[];
    final length = AuthenticationType.signUp.authenticationOptions.length;

    for (int i = 0; i < length; i++) {
      final authOption = AuthenticationType.signUp.authenticationOptions[i];
      signUpOptions
        ..add(XButton(
          height: 44,
          style: authOption == AuthenticationOptions.phoneOrEmail
              ? XButtonStyle.contained
              : XButtonStyle.outlined,
          borderColor: authOption == AuthenticationOptions.phoneOrEmail
              ? null
              : context.borderColor.withOpacity(.5),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: authOption.toIcon,
              ),
              Align(
                alignment: Alignment.center,
                child: XText(
                  context.translate(authOption.toTitle),
                  style: authOption != AuthenticationOptions.phoneOrEmail
                      ? null
                      : context.bodyMedium?.copyWith(color: context.lightColor),
                ),
              )
            ],
          ),
          onPressed: () {
            EventBus().event<AuthenticationBloc>(
              Keys.Blocs.authenticationBloc,
              AuthenticationSignedInWithGoogle(),
            );
          },
        ))
        ..add(SizedBox(
          height: i == length - 1 ? 0 : 12,
        ));
    }

    return signUpOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          XText.headlineMedium(context.translate(
            Strings.Authentication.signUpTitle,
          )),
          const SizedBox(
            height: 12,
          ),
          XText.bodySmall(
            context.translate(Strings.Authentication.signUpSlogan),
            textAlign: TextAlign.center,
            style: context.bodySmall?.copyWith(color: context.borderHoverColor),
          ),
          const SizedBox(
            height: 32,
          ),
          ..._buildSignUpOptions(context),
        ],
      ),
    );
  }
}
