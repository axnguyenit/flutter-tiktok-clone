import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/constants/constants.dart';

part 'messaging_event.dart';
part 'messaging_state.dart';

class MessagingBloc extends BaseBloc<MessagingEvent, MessagingState> {
  MessagingBloc(Key key) : super(key, initialState: MessagingInitial()) {
    on<MessagingTopicsSubscribed>(_onMessagingTopicsSubscribed);
    on<MessagingAllTopicsUnsubscribed>(_onMessagingAllTopicsUnsubscribed);
    on<MessagingShouldRegistered>(_onMessagingShouldRegistered);
    on<MessagingRegistered>(_onMessagingRegistered);
  }

  factory MessagingBloc.instance() {
    final key = Keys.Blocs.messagingBloc;
    return EventBus().newBlocWithConstructor<MessagingBloc>(
      key,
      () => MessagingBloc(key),
    );
  }

  Future<void> _onMessagingTopicsSubscribed(
    MessagingTopicsSubscribed event,
    Emitter<MessagingState> emit,
  ) async {
    emit(MessagingTopicsSubscribeSuccess(event.topics));
  }

  Future<void> _onMessagingAllTopicsUnsubscribed(
    MessagingAllTopicsUnsubscribed event,
    Emitter<MessagingState> emit,
  ) async {
    emit(MessagingAllTopicsUnsubscribeSuccess());
  }

  Future<void> _onMessagingShouldRegistered(
    MessagingShouldRegistered event,
    Emitter<MessagingState> emit,
  ) async {
    emit(MessagingRegisterInReady());
  }

  Future<void> _onMessagingRegistered(
    MessagingRegistered event,
    Emitter<MessagingState> emit,
  ) async {
    emit(MessagingRegisterSuccess());
  }
}
