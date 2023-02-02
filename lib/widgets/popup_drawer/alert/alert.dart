// ignore_for_file: constant_identifier_names

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

class Alert extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String message;
  final String? okTitle;

  const Alert({
    Key? key,
    this.icon,
    this.title = '',
    required this.message,
    this.okTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBounce(
        child: AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              icon ?? XText.headlineMedium(title),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 16,
                ),
                child: SpanLabel(text: message),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.all(8),
          content: Container(
            margin: const EdgeInsets.all(8),
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Spacer(),
                XButton.outlined(
                  title: okTitle ?? 'Close',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  color: AppColors.danger,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
          contentPadding: const EdgeInsets.all(16),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
