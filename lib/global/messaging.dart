import 'dart:io';

import 'package:common/common.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tiktok/global/provider.dart';

class Messaging {
  final FirebaseMessaging firebaseMessaging;
  final List<String> subscribedTopics = <String>['topic_all_users'];

  Messaging({required this.firebaseMessaging});

  Future<void> addTopics(List<String> topics) async {
    final addingTopics = <String>[];
    for (final topic in topics) {
      if (!subscribedTopics.contains(topic) && topic.isNotEmpty) {
        addingTopics.add(topic);
      }
    }
    if (addingTopics.isEmpty) {
      return;
    }

    await Future.wait(
      addingTopics.map(firebaseMessaging.subscribeToTopic).toList(),
    );
    subscribedTopics.addAll(addingTopics);
  }

  Future<void> unsubscribeAllTopics() async {
    await Future.wait(
      subscribedTopics.map(firebaseMessaging.unsubscribeFromTopic).toList(),
    );
    subscribedTopics.clear();
  }

  static void startListening() {
    FirebaseMessaging.onMessage.listen((message) {
      log.info('Message onReceive >> $message');
      // trigger when open app
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      log.info('Open Message onReceive >>>> ${message.data}');
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      log.info('onBackgroundMessage >>>> ${message.data}');
    });
  }

  Future<void> start({List<String> topics = const <String>[]}) async {
    if (Platform.isIOS) {
      await _iOSRequestPermission();
    }

    final token = await firebaseMessaging.getToken();
    log.info('Firebase Token Now: $token');
    if (token == null) {
      return;
    }
    log.info('Firebase Token: $token');

    try {
      final userService = Provider().userService;

      // ignore: cascade_invocations
      userService.registerDeviceIfNeeded(
        deviceToken: token,
        forceUpToDate: true,
      );

      if (topics.isNotEmpty) {
        subscribedTopics.addAll(topics);
      }
      if (subscribedTopics.isNotEmpty) {
        await Future.wait(
          subscribedTopics.map(firebaseMessaging.subscribeToTopic).toList(),
        );
      }
    } catch (e) {
      log.error('Register Device Error >> $e');
    }
  }

  Future<void> _iOSRequestPermission() async {
    final settings = await firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
    );
    log.info('User granted permission: ${settings.authorizationStatus}');
  }
}
