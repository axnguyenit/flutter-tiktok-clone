// ignore_for_file: constant_identifier_names

enum AppIcons {
  appIcon,
  facebook,
  google,
  instagram,
  kakaotalk,
  line,
  twitter,
}

const _AppIconsAsset = {
  AppIcons.appIcon: '',
  AppIcons.facebook: 'assets/icons/facebook.svg',
  AppIcons.google: 'assets/icons/google.svg',
  AppIcons.instagram: 'assets/icons/instagram.svg',
  AppIcons.kakaotalk: 'assets/icons/kakaotalk.svg',
  AppIcons.line: 'assets/icons/line.svg',
  AppIcons.twitter: 'assets/icons/twitter.svg',
};

extension AppIconsExtension on AppIcons {
  String toAssetName() {
    final assets = _AppIconsAsset[this];
    if (assets != null) {
      return assets;
    }
    return 'assets/icons/error.svg';
  }
}
