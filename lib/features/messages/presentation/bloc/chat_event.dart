

import 'package:social_connect_app/features/messages/domain/entities/message.dart';

abstract class ChatEvent {}

class InitialEvent extends ChatEvent {}

class LoadChatsEvent extends ChatEvent {}

class LoadMessagesEvent extends ChatEvent {
  final String chatId;
  LoadMessagesEvent(this.chatId);
}

class SendMessageEvent extends ChatEvent {
  final String chatId;
  final Message message;
  SendMessageEvent(this.chatId, this.message);
}

class MessageButtonClickedEvent extends ChatEvent {
  final String phoneNumber;
  final String chatId;
  MessageButtonClickedEvent({required this.phoneNumber , required this.chatId});
}
