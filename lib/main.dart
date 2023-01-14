import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'package:tiktok/modules/tiktok_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = SimpleBlocObserver();
  runZonedGuarded(_runApp, _reportError);
}

void _runApp() {
  runApp(const TikTokApp());
}

void _reportError(Object error, StackTrace stackTrace) {
  log.error(error.toString());
}
