import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef BlocConstructor<T extends BaseBloc> = T Function();

class RetryEvent {
  final Key key;
  final Object event;
  final Key _retryOnKey;
  final Duration? delay;

  Key get retryOnKey => _retryOnKey;

  RetryEvent({
    required this.key,
    required this.event,
    this.delay,
    Key? retryOnKey,
  }) : _retryOnKey = retryOnKey ?? key;
}

class EventBus {
  static final EventBus _singleton = EventBus._internal();

  factory EventBus() {
    return _singleton;
  }

  List<BaseBloc> _blocs = [];
  List<Broadcast> _broadcasts = [];

  List<RetryEvent> _retryEvents = [];

  EventBus._internal() {
    _blocs = [];
    _broadcasts = [];
    _retryEvents = [];
  }

  T newBlocWithConstructor<T extends BaseBloc>(
    Key key,
    BlocConstructor<T> constructor,
  ) {
    final found = _blocs.indexWhere((b) => b.key == key);
    if (found >= 0 && _blocs[found] is T) {
      return _blocs[found] as T;
    }

    try {
      final T newInstance = constructor();
      log.trace('New Bloc is created with key = $key');
      _blocs.add(newInstance);
      if (newInstance.subscribes().isNotEmpty) {
        _broadcasts.addAll(newInstance.subscribes());
      }
      unawaited(_retryEvent<T>(key));
      return newInstance;
    } catch (e) {
      log.error('Error in new instance of bloc $key: $e');
    }
    throw Exception('Something went wrong in creating bloc with key $key');
  }

  T? blocFromKey<T extends BaseBloc>(Key key) {
    final found = _blocs.indexWhere((b) => b.key == key);
    if (found >= 0 && _blocs[found] is T) {
      return _blocs[found] as T;
    }
    return null;
  }

  void event<T extends BaseBloc>(
    Key key,
    Object event, {
    bool retryLater = false,
    Key? retryOnKey,
    Duration? delay,
  }) {
    try {
      final found = _blocs.indexWhere((b) => b.key == key);
      final checkKindOfBloc = retryOnKey == null || key == retryOnKey;
      if (found >= 0 && (!checkKindOfBloc || _blocs[found] is T)) {
        if (delay != null) {
          Future.delayed(delay, () {
            _blocs[found].add(event);
          });
        } else {
          _blocs[found].add(event);
        }
      } else {
        log.error('Cannot found bloc with key $key for event $event');
        if (retryLater) {
          _retryEvents.add(
            RetryEvent(
              key: key,
              event: event,
              delay: delay,
              retryOnKey: retryOnKey,
            ),
          );
        }
      }
    } catch (e) {
      log.error('Call bloc event error: $e');
    }
  }

  void broadcast(String event, {Map params = const {}}) {
    for (final b in _broadcasts) {
      if (b.event == event) {
        b.onNext(params);
      }
    }
  }

  void unsubscribes(Key blocKey) {
    _broadcasts.removeWhere((b) {
      return b.blocKey == blocKey;
    });
  }

  void unhandle(Key blocKey) {
    _blocs.removeWhere((b) {
      return b.key == blocKey || b.closeWithBlocKey == blocKey;
    });
  }

  Future<void> _retryEvent<T extends BaseBloc>(Key key) async {
    for (var i = 0; i < _retryEvents.length; i++) {
      final retry = _retryEvents[i];
      if (retry.key == key) {
        if (retry.delay != null) {
          Future.delayed(retry.delay!, () {
            event<T>(retry.key, retry.event);
            _retryEvents.removeAt(i);
          });
        } else {
          event<T>(retry.key, retry.event);
          _retryEvents.removeAt(i);
        }
        break;
      }
    }
  }

  void cleanUp({Key? parentKey}) {
    final removedKeys = <Key>[];
    final closeKey = parentKey ?? const ValueKey('none_dispose_bloc');
    _blocs.removeWhere((b) {
      if (b.closeWithBlocKey == closeKey) {
        removedKeys.add(b.key);
        return true;
      }
      return false;
    });

    _broadcasts.removeWhere((b) {
      return removedKeys.contains(b.blocKey);
    });
  }
}
