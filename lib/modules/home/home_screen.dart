import 'package:flutter/material.dart';
import 'package:tiktok/constants/screens.dart';
import 'package:tiktok/global/global.dart';
import 'package:tiktok/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const XText.headlineMedium('HOME SCREEN'),
              const SizedBox(height: 14),
              XButton(
                title: 'Sign In',
                onPressed: () {
                  AppRouting().pushReplacementNamed(
                    context,
                    Screens.signIn.toName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
