// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

class BasePopupDrawer extends StatelessWidget {
  final BuildContext context;
  final Widget child;

  const BasePopupDrawer({
    Key? key,
    required this.context,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => child;

  Future<T?> show<T>() async {
    return showGeneralDialog<T>(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: build(context),
          ),
        );
      },
      barrierDismissible: false,
      barrierColor: Colors.black.withAlpha(40),
      transitionDuration: const Duration(milliseconds: 150),
    );
  }
}
