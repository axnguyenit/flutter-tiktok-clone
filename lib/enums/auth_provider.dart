enum AuthProvider {
  email,
  google,
  facebook;

  static AuthProvider fromKey(String key) {
    switch (key) {
      case 'Google':
        return AuthProvider.google;
      case 'Facebook':
        return AuthProvider.facebook;
      default:
        return AuthProvider.email;
    }
  }
}

extension AuthProviderExtension on AuthProvider {
  String get value {
    switch (this) {
      case AuthProvider.email:
        return 'Email';
      case AuthProvider.google:
        return 'Google';
      case AuthProvider.facebook:
        return 'Facebook';
    }
  }
}
