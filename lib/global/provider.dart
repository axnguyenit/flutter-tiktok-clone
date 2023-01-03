import 'package:tiktok/models/models.dart';
import 'package:tiktok/services/services.dart';

class Provider {
  static final Provider _singleton = Provider._internal();
  UserModel? signedInUser;

  factory Provider() => _singleton;

  Provider._internal();

  bool isPhysicalDevice = true;

  bool isInitialized = false;

  // *********** SERVICES *********** //
  AuthenticationService get authenticationService =>
      AuthenticationServiceImpl();
}
