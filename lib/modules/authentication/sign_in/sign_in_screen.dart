import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';
import 'package:shared/shared.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const XText.headlineMedium('SIGN IN SCREEN'),
              const SizedBox(height: 24),
              XButton(
                title: context.translate(Strings.Button.home),
                onPressed: () {
                  log
                    ..debug('debug')
                    ..info('info')
                    ..fatal('fatal')
                    ..error('error')
                    ..trace('trace')
                    ..warning('warning');
                  Navigator.of(context).pushReplacementNamed(Screens.home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
