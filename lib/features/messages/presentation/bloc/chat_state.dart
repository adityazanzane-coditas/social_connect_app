import 'package:social_connect_app/features/messages/domain/entities/chat.dart';
import 'package:social_connect_app/features/messages/domain/entities/message.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class LoadingDataState extends ChatState {}

class ChatsLoaded extends ChatState {
  final List<Chat> chats;
  ChatsLoaded(this.chats);
}

class MessagesLoaded extends ChatState {
  final List<Message> messages;
  MessagesLoaded(this.messages);
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}

class NavigateToChatScreen extends ChatState {
  final String phoneNumber;

  NavigateToChatScreen({required this.phoneNumber});
}
