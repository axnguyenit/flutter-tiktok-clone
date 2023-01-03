import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/modules/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:tiktok/modules/inbox/inbox_screen.dart';
import 'package:tiktok/modules/profile/unauthenticated_profile_screen.dart';
import 'package:tiktok/modules/shop/shop_screen.dart';

enum BottomBar { home, shop, inbox, profile }

typedef OnNavigateToTab = void Function(BottomBar tab,
    {Map<String, dynamic> params});

List<BottomBar> get allBottomBarItems => [
      BottomBar.home,
      BottomBar.shop,
      BottomBar.inbox,
      BottomBar.profile,
    ];

BottomBar bottomBarFromIndex(int index) {
  return BottomBar.values[index];
}

extension BottomBarExtension on BottomBar {
  Widget toScreen({OnNavigateToTab? onNavigateToTab}) {
    switch (this) {
      case BottomBar.home:
        return const HomeScreen();
      case BottomBar.shop:
        return const ShopScreen();
      case BottomBar.inbox:
        return const InboxScreen();
      case BottomBar.profile:
        return const UnauthenticatedProfileScreen();
    }
  }

  String toTitle() {
    switch (this) {
      case BottomBar.home:
        return Strings.BottomBar.home;
      case BottomBar.shop:
        return Strings.BottomBar.shop;
      case BottomBar.inbox:
        return Strings.BottomBar.inbox;
      case BottomBar.profile:
        return Strings.BottomBar.profile;
    }
  }

  IconData _toIcon() {
    switch (this) {
      case BottomBar.home:
        return Icons.home_outlined;
      case BottomBar.shop:
        return Icons.shopping_bag_outlined;
      case BottomBar.inbox:
        return Icons.chat_outlined;
      case BottomBar.profile:
        return Icons.person_outline;
    }
  }

  IconData _toActiveIcon() {
    switch (this) {
      case BottomBar.home:
        return Icons.home_rounded;
      case BottomBar.shop:
        return Icons.shopping_bag_rounded;
      case BottomBar.inbox:
        return Icons.chat_rounded;
      case BottomBar.profile:
        return Icons.person;
    }
  }

  BottomNavigationBarItem toNavigationBarItem(
    BuildContext context,
    bool isHome,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        _toIcon(),
        size: 22,
        color: isHome ? context.lightColor : context.borderHoverColor,
      ),
      activeIcon: Icon(
        _toActiveIcon(),
        size: 22,
        color: isHome ? context.lightColor : context.darkColor,
      ),
      label: context.translate(toTitle()),
    );
  }
}
