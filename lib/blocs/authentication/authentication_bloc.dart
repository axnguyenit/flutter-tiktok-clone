import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
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
    final key = Keys.Bloc.authenticationBloc;

    return EventBus().newBlocWithConstructor<AuthenticationBloc>(
      key,
      AuthenticationBloc(
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
    } catch (e) {
      log.error('*********** SIGN IN WITH GOOGLE ERROR >>>> $e ***********');
    }
  }
}
