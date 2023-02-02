abstract class UserService {
  void registerDeviceIfNeeded({
    required String deviceToken,
    bool forceUpToDate,
  });
}
