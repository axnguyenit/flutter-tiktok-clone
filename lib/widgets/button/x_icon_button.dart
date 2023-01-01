import 'package:flutter/material.dart';

class XIconButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final double? minWidth;
  final Color? iconColor;
  final BoxBorder? border;
  final Color? background;
  final VoidCallback? onPressed;

  const XIconButton({
    Key? key,
    this.border,
    this.minWidth,
    this.iconSize,
    this.iconColor,
    this.onPressed,
    this.background,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        onPressed: onPressed,
        splashRadius: (minWidth ?? 45) - 25,
        iconSize: iconSize ?? 22,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: minWidth ?? 45,
          minHeight: minWidth ?? 45,
        ),
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
