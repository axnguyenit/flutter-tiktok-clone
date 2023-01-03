// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

class Strings {
  static _Button get Button => _Button();

  static _BottomBar get BottomBar => _BottomBar();

  static _App get App => _App();

  static _Authentication get Authentication => _Authentication();
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

class _Authentication {
  final String phoneOrEmail = 'authentication.use_phone_or_email';
  final String facebook = 'authentication.facebook';
  final String google = 'authentication.google';
  final String twitter = 'authentication.twitter';
  final String line = 'authentication.line';
  final String kakaoTalk = 'authentication.kakaoTalk';
  final String phoneOrEmailOrUsername =
      'authentication.phone_or_email_or_username';
  final String instagram = 'authentication.instagram';
  final String signUpSlogan = 'authentication.sign_up_slogan';
  final String signInSlogan = 'authentication.sign_in_slogan';
  final String signUpTitle = 'authentication.sign_up_title';
  final String signInTitle = 'authentication.sign_in_title';
  final String goToSignIn = 'authentication.go_to_sign_in';
  final String goToSignUp = 'authentication.go_to_sign_up';
}

class _App {
  final String policyAndTerms = 'app.policy_and_terms';
  final String signInOrSignUp = 'app.sign_in_or_sign_up';
}
