enum Screen { example, invalid }

enum Screens {
  home,
  signIn,
  splash,
  error,
  videoCreation;

  String get toName {
    switch (this) {
      case Screens.home:
        return 'Home';
      case Screens.splash:
        return 'Splash';
      case Screens.signIn:
        return 'SignIn';
      case Screens.error:
        return 'Error';
      case Screens.videoCreation:
        return 'VideoCreation';
    }
  }

  String get toPath {
    switch (this) {
      case Screens.home:
        return '/';
      case Screens.splash:
        return 'splash';
      case Screens.signIn:
        return 'sign-in';
      case Screens.error:
        return 'error';
      case Screens.videoCreation:
        return 'video-creation';
    }
  }
}
