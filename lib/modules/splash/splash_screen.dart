import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final MediaQueryData mediaQueryData = MediaQuery.of(context);
      final statusBarHeight = mediaQueryData.viewPadding.top;
      final size = mediaQueryData.size;

      AppConstants.statusBarHeight = statusBarHeight;
      AppConstants.screenSize = size;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pushReplacementNamed(Screens.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
