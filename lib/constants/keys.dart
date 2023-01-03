// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';

class Keys {
  static _Bloc get Bloc => _Bloc();
}

class _Bloc {
  final authenticationBloc = const Key('authentication_bloc');
}
