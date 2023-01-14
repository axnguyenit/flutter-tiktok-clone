import 'package:shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/global/global.dart';
import 'package:tiktok/models/models.dart';
import 'package:tiktok/services/services.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends BaseBloc<SessionEvent, SessionState> {
  final AuthenticationService _authenticationService;

  SessionBloc(
    Key key, {
    required AuthenticationService authenticationService,
  })  : _authenticationService = authenticationService,
        super(key, initialState: SessionInitial()) {
    on<SessionLoaded>(_onSessionLoaded);
    on<SessionUserSignedIn>(_onSessionUserSignedIn);
    on<SessionSignedOut>(_onSessionSignedOut);
  }

  factory SessionBloc.instance() {
    final key = Keys.Blocs.sessionBloc;

    return EventBus().newBlocWithConstructor<SessionBloc>(
      key,
      SessionBloc(
        key,
        authenticationService: Provider().authenticationService,
      ),
    );
  }

  @override
  List<Broadcast> subscribes() {
    return [
      Broadcast(
        blocKey: key,
        event: Keys.Broadcast.signInSuccess,
        onNext: (data) {
          final UserModel user = data['user'];

          add(SessionUserSignedIn(user));
        },
      )
    ];
  }

  void start() {
    if (state is SessionInitial) {
      add(const SessionLoaded());
    }
  }

  Future<void> _onSessionUserSignedIn(
    SessionUserSignedIn event,
    Emitter<SessionState> emit,
  ) async {
    debugPrint('*********** SESSION USER SIGNED IN ***********');
    emit(SessionUserSignInSuccess(
      user: event.signedInUser,
    ));
  }

  Future<void> _onSessionLoaded(
    SessionLoaded event,
    Emitter<SessionState> emit,
  ) async {
    debugPrint('*********** SESSION LOADED START ***********');

    try {
      final signedInUser = await _authenticationService.getCurrentUser();

      Provider().signedInUser = signedInUser;

      emit(SessionUserSignInSuccess(
        user: signedInUser,
      ));
    } catch (e) {
      debugPrint('*********** SESSION LOADED ERROR >>>> $e ***********');
      emit(SessionLoadFailure());
    }
  }

  Future<void> _onSessionSignedOut(
    SessionSignedOut event,
    Emitter<SessionState> emit,
  ) async {
    // if (!_authenticationService.isSignedIn) {
    //   return;
    // }

    try {
      await _authenticationService.signOut();
      Provider().signedInUser = null;

      emit(SessionSignOutSuccess());
    } on Exception {
      // handleException(e);
    }
  }
}
