import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:tiktok/modules/tiktok_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runZonedGuarded(_runApp, _reportError);
}

Future<void> _runApp() async {
  runApp(const TikTokApp());
}

void _reportError(Object error, StackTrace stackTrace) {
  log.error(error);
}
