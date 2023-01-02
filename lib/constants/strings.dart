// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

class Strings {
  static _Button get Button => _Button();

  static _BottomBar get BottomBar => _BottomBar();
}

class _Button {
  final String home = 'button.home';
  final String signIn = 'button.signIn';
}

class _BottomBar {
  final String home = 'bottom_bar.home';
  final String shop = 'bottom_bar.shop';
  final String inbox = 'bottom_bar.inbox';
  final String profile = 'bottom_bar.profile';
}
