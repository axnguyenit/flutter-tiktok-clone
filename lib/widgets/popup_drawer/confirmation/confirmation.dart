// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:tiktok/widgets/widgets.dart';

class Confirmation extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String message;
  final String? okTitle;
  final String? cancelTitle;

  const Confirmation({
    Key? key,
    this.icon,
    this.title = '',
    required this.message,
    this.okTitle,
    this.cancelTitle,
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
                Expanded(
                  child: XButton.outlined(
                    title: cancelTitle ?? 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: XButton.contained(
                    title: okTitle ?? 'OK',
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
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
