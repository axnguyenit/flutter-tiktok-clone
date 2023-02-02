part of 'messaging_bloc.dart';

abstract class MessagingEvent {
  const MessagingEvent();
}

class MessagingShouldRegistered extends MessagingEvent {
  MessagingShouldRegistered();
}

class MessagingRegistered extends MessagingEvent {
  MessagingRegistered();
}

class MessagingTopicsSubscribed extends MessagingEvent {
  final List<String> topics;
  MessagingTopicsSubscribed(this.topics);
}

class MessagingAllTopicsUnsubscribed extends MessagingEvent {
  MessagingAllTopicsUnsubscribed();
}
