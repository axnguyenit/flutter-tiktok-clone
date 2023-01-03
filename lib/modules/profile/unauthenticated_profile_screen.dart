import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/modules/common/common.dart';
import 'package:tiktok/widgets/widgets.dart';

import 'toggle_widgets_controller.dart';
import 'sign_in_options.dart';
import 'sign_up_options.dart';

class UnauthenticatedProfileScreen extends StatefulWidget {
  const UnauthenticatedProfileScreen({super.key});

  @override
  State<UnauthenticatedProfileScreen> createState() =>
      _UnauthenticatedProfileScreenState();
}

class _UnauthenticatedProfileScreenState
    extends State<UnauthenticatedProfileScreen> {
  final ToggleWidgetsController _controller = ToggleWidgetsController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.children = [
        const SignUpOptions(),
        const SignInOptions(),
      ];
    });
  }

  Widget _buildBottomDrawer() {
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

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        XIconButton(
          icon: Icons.menu_rounded,
          onPressed: () {},
        ),
      ],
      title: XText.headlineSmall(context.translate(
        Strings.BottomBar.profile,
      )),
    );
  }

  Future<void> _openSignUpBottomDrawer() async {
    await BottomDrawer.of(context)
        .standard(
          padding: const EdgeInsets.all(0),
          child: _buildBottomDrawer(),
        )
        .show();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const ProfileInfo(),
            const SizedBox(
              height: 128,
            ),
            XButton(
              title: context.translate(
                Strings.App.signInOrSignUp,
              ),
              onPressed: _openSignUpBottomDrawer,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
