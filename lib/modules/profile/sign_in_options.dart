import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

import 'authentication_options.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});

  List<Widget> _buildSignInOptions(BuildContext context) {
    final signInOptions = <Widget>[];
    final length = AuthenticationType.signIn.authenticationOptions.length;

    for (int i = 0; i < length; i++) {
      final authOption = AuthenticationType.signIn.authenticationOptions[i];
      signInOptions
        ..add(XButton.outlined(
          height: 44,
          borderColor: context.borderColor.withOpacity(.5),
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
                ),
              )
            ],
          ),
          onPressed: () {},
        ))
        ..add(SizedBox(
          height: i == length - 1 ? 0 : 12,
        ));
    }

    return signInOptions;
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
            Strings.Authentication.signInTitle,
          )),
          const SizedBox(
            height: 12,
          ),
          XText.bodySmall(
            context.translate(Strings.Authentication.signInSlogan),
            textAlign: TextAlign.center,
            style: context.bodySmall?.copyWith(color: context.borderHoverColor),
          ),
          const SizedBox(
            height: 32,
          ),
          ..._buildSignInOptions(context),
        ],
      ),
    );
  }
}
