import 'package:tiktok/models/models.dart';

class Provider {
  static final Provider _singleton = Provider._internal();
  User? signedInUser;

  factory Provider() => _singleton;

  Provider._internal();

  bool isPhysicalDevice = true;

  bool isInitialized = false;

  // *********** SERVICES *********** //
}
