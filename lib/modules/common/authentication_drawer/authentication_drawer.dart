import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

import 'sign_in_options.dart';
import 'sign_up_options.dart';
import 'toggle_widgets_controller.dart';

class AuthenticationDrawer extends StatefulWidget {
  const AuthenticationDrawer({super.key});

  @override
  State<AuthenticationDrawer> createState() => _AuthenticationDrawerState();
}

class _AuthenticationDrawerState extends State<AuthenticationDrawer> {
  final ToggleWidgetsController _controller = ToggleWidgetsController();

  @override
  void initState() {
    super.initState();

    _controller.children = [
      const SignUpOptions(),
      const SignInOptions(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.screenSize.height - 40,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                AppConstants.AppHorizontalPadding,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: context.iconColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: context.iconColor,
                        ),
                      ),
                    ],
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: _controller.currentPage,
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SpanLabel(
              text: context.translate(
                Strings.App.policyAndTerms,
              ),
              fontSize: 12.0,
              color: context.borderHoverColor,
              textAlign: TextAlign.center,
              boldStyle: context.bodySmall?.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: context.darkColor,
              ),
            ),
          ),
          XButton(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: context.borderColor.withOpacity(.7),
            borderColor: context.borderColor,
            onPressed: _controller.toggleWidget,
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return SpanLabel(
                    text: _controller.currentPage is SignUpOptions
                        ? context.translate(Strings.Authentication.goToSignIn)
                        : context.translate(Strings.Authentication.goToSignUp),
                    boldStyle: context.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
