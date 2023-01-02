import 'dart:ui';

import 'package:flutter/material.dart';

part 'base_bottom_drawer.dart';

class BottomDrawer {
  final BuildContext context;
  Widget? child;

  BottomDrawer.of(this.context);

  BaseBottomDrawer standard({
    required Widget child,
  }) {
    return BaseBottomDrawer(
      context: context,
      child: child,
    );
  }
}
