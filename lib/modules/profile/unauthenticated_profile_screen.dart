import 'package:flutter/material.dart';
import 'package:tiktok/blocs/mixins/mixins.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/modules/common/authentication_drawer/authentication_drawer.dart';
import 'package:tiktok/modules/common/common.dart';
import 'package:tiktok/widgets/widgets.dart';

class UnauthenticatedProfileScreen extends StatefulWidget {
  const UnauthenticatedProfileScreen({super.key});

  @override
  State<UnauthenticatedProfileScreen> createState() =>
      _UnauthenticatedProfileScreenState();
}

class _UnauthenticatedProfileScreenState
    extends State<UnauthenticatedProfileScreen> with SessionData {
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

  Future<void> _showAuthenticationBottomDrawer() async {
    if (currentUser != null) {
      return;
    }
    await BottomDrawer.of(context)
        .standard(
          padding: const EdgeInsets.all(0),
          child: const AuthenticationDrawer(),
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
              onPressed: _showAuthenticationBottomDrawer,
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
