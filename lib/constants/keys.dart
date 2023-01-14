// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';

class Keys {
  static _Blocs get Blocs => _Blocs();

  static _Broadcast get Broadcast => _Broadcast();
}

class _Blocs {
  final authenticationBloc = const Key('authentication_bloc');

  final sessionBloc = const Key('session_bloc');

  final authenticationDrawerBloc = const Key('authentication_drawer_bloc');
}

class _Broadcast {
  static final _singleton = _Broadcast._internal();

  factory _Broadcast() {
    return _singleton;
  }

  _Broadcast._internal();

  final String signInSuccess = 'sign_in_success_broadcast';

  final String signOutSuccess = 'sign_out_success_broadcast';
}
