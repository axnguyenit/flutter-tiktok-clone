import 'package:tiktok/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  final AppIcons icon;
  final double? width;
  final double? height;
  final Color? color;

  const AppIcon({
    Key? key,
    this.width,
    this.height,
    this.color,
    required this.icon,
  }) : super(key: key);

  factory AppIcon.appIcon({
    double width = 100,
    double height = 24,
    Color color = Colors.white,
  }) {
    return AppIcon(
      icon: AppIcons.appIcon,
      width: width,
      height: height,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon.toAssetName(),
      width: width,
      height: height,
      color: color,
    );
  }
}
