import 'package:flutter/material.dart';

import 'alert/alert.dart';
import 'base_popup_drawer.dart';
import 'confirmation/confirmation.dart';

class PopupDrawer {
  final BuildContext context;

  PopupDrawer.of(this.context);

  BasePopupDrawer confirmation({
    Key? key,
    required String title,
    required String message,
    String? okTitle,
    String? cancelTitle,
    Widget? icon,
  }) {
    return BasePopupDrawer(
      context: context,
      key: key,
      child: Confirmation(
        title: title,
        message: message,
        okTitle: okTitle,
        cancelTitle: cancelTitle,
        icon: icon,
      ),
    );
  }

  BasePopupDrawer alert({
    Key? key,
    required String title,
    required String message,
    String? okTitle,
    Widget? icon,
  }) {
    return BasePopupDrawer(
      context: context,
      key: key,
      child: Alert(
        title: title,
        message: message,
        okTitle: okTitle,
        icon: icon,
      ),
    );
  }

  BasePopupDrawer open({
    Key? key,
    required Widget widget,
  }) {
    return BasePopupDrawer(
      context: context,
      key: key,
      child: widget,
    );
  }
}
