// ignore_for_file: constant_identifier_names

enum AppIcons {
  appIcon,
  arrow,
  menu,
  flower,
  heart,
  user,
  search,
  arrowLeft,
  more,
  sun,
  temperature,
  humidity,
  wind
}

const _AppIconsAsset = {
  AppIcons.appIcon: '',
  AppIcons.menu: 'assets/icons/menu.svg',
  AppIcons.flower: 'assets/icons/flower.svg',
  AppIcons.heart: 'assets/icons/heart.svg',
  AppIcons.user: 'assets/icons/user.svg',
  AppIcons.search: 'assets/icons/search.svg',
  AppIcons.arrowLeft: 'assets/icons/arrow-left.svg',
  AppIcons.more: 'assets/icons/more.svg',
  AppIcons.sun: 'assets/icons/sun.svg',
  AppIcons.temperature: 'assets/icons/temperature.svg',
  AppIcons.humidity: 'assets/icons/humidity.svg',
  AppIcons.wind: 'assets/icons/wind.svg',
};

extension AppIconsExtension on AppIcons {
  String toAssetName() {
    final assets = _AppIconsAsset[this];
    if (assets != null) {
      return assets;
    }
    return 'assets/icons/placeholder.svg';
  }
}
