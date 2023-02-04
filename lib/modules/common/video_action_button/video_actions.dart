import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/widgets/widgets.dart';

enum VideoActions {
  like,
  comment,
  bookmark,
  share;

  Widget get getIcon {
    switch (this) {
      case VideoActions.like:
        return const AppIcon(
          icon: AppIcons.heart,
          color: Colors.white,
          width: 36,
          height: 36,
        );
      case VideoActions.comment:
        return const Icon(
          Icons.chat_rounded,
          color: Colors.white,
          size: 32,
        );
      case VideoActions.bookmark:
        return const Icon(
          Icons.bookmark,
          color: Colors.white,
          size: 36,
        );
      case VideoActions.share:
        return const Icon(
          Icons.reply,
          color: Colors.white,
          textDirection: TextDirection.rtl,
          size: 36,
        );
    }
  }
}
