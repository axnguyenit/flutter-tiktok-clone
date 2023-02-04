import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

class VideoActionButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final String amount;

  const VideoActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: icon,
          padding: EdgeInsets.zero,
          onPressed: onPressed,
        ),
        XText.bodySmall(
          amount,
          style: context.bodySmall?.copyWith(
            color: context.lightColor,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
