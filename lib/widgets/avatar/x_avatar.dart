import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok/widgets/widgets.dart';

class XAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const XAvatar({
    Key? key,
    this.imageUrl = '',
    this.name = '',
    this.size = 40.0,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? XImageNetwork(
            imageUrl: imageUrl,
            borderRadius: BorderRadius.circular(100.0),
            width: size,
            height: size,
          )
        : _buildAvatarWithoutImage(context);
  }

  Widget _buildAvatarWithoutImage(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: color ??
            Colors.primaries[Random().nextInt(
              Colors.primaries.length,
            )],
      ),
      child: Center(
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: fontSize ?? 20,
            color: color ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
