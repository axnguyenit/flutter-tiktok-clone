import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            XText.headlineMedium('PROFILE SCREEN'),
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
