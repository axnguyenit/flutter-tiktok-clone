import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/global/global.dart';
import 'package:tiktok/services/services.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends BaseBloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authenticationService;
  AuthenticationBloc(Key key,
      {required AuthenticationService authenticationService})
      : _authenticationService = authenticationService,
        super(key, initialState: AuthenticationInitial()) {
    on<AuthenticationSignedInWithFacebook>(_onSignInWithFacebook);
    on<AuthenticationSignedInWithGoogle>(_onSignInWithGoogle);
  }

  factory AuthenticationBloc.instance() {
    final key = Keys.Blocs.authenticationBloc;

    return EventBus().newBlocWithConstructor<AuthenticationBloc>(
      key,
      () => AuthenticationBloc(
        key,
        authenticationService: Provider().authenticationService,
      ),
    );
  }

  Future<void> _onSignInWithFacebook(
    AuthenticationSignedInWithFacebook event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationService.signInWithFacebook();
      final user = await _authenticationService.getCurrentUser();
      log.info('*********** FACEBOOK SIGNED IN ***********');

      EventBus().broadcast(
        Keys.Broadcast.signInSuccess,
        params: {'user': user, 'justSignUp': false},
      );
    } catch (e) {
      log.error('*********** SIGN IN WITH FACEBOOK ERROR >>>> $e ***********');
    }
  }

  Future<void> _onSignInWithGoogle(
    AuthenticationSignedInWithGoogle event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationService.signInWithGoogle();
      final user = await _authenticationService.getCurrentUser();

      log.info('*********** GOOGLE SIGNED IN ***********');

      EventBus().broadcast(
        Keys.Broadcast.signInSuccess,
        params: {'user': user, 'justSignUp': false},
      );
    } catch (e) {
      log.error('*********** SIGN IN WITH GOOGLE ERROR >>>> $e ***********');
    }
  }
}
