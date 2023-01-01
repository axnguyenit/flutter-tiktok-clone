import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: const [
                      XText.headlineMedium('HOME SCREEN'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: XButton(
                title: context.translate(Strings.Button.signIn),
                onPressed: () {
                  log
                    ..debug('debug')
                    ..info('info')
                    ..fatal('fatal')
                    ..error('error')
                    ..trace('trace')
                    ..warning('warning');
                  Navigator.of(context).pushReplacementNamed(Screens.signIn);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
