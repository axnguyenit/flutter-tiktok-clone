import 'package:common/common.dart';
import 'package:tiktok/blocs/blocs.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/models/user.dart';

mixin SessionData {
  bool get isGuest =>
      EventBus()
          .blocFromKey<SessionBloc>(Keys.Blocs.sessionBloc)
          ?.state
          .signedInUser ==
      null;

  UserModel? get currentUser => EventBus()
      .blocFromKey<SessionBloc>(Keys.Blocs.sessionBloc)
      ?.state
      .signedInUser;
}
