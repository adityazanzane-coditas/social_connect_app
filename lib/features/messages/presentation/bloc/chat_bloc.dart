import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/features/messages/domain/entities/chat.dart';
import 'package:social_connect_app/features/messages/domain/entities/message.dart';
import 'package:social_connect_app/features/messages/domain/usecases/get_chats.dart';
import 'package:social_connect_app/features/messages/domain/usecases/get_messages.dart';
import 'package:social_connect_app/features/messages/domain/usecases/send_message.dart';
import 'package:social_connect_app/features/messages/presentation/bloc/chat_event.dart';
import 'package:social_connect_app/features/messages/presentation/bloc/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChats getChats;
  final GetMessages getMessages;
  final SendMessage sendMessage;

  ChatBloc({
    required this.getChats,
    required this.getMessages,
    required this.sendMessage,
  }) : super(ChatInitial()) {
    on<InitialEvent>(initialEvent);
    on<MessageButtonClickedEvent>(messageButtonClickedEvent);

    // on<LoadChatsEvent>((event, emit) async {
    //   await emit.forEach<List<Chat>>(
    //     getChats(),
    //     onData: (chats) => ChatsLoaded(chats),
    //     onError: (error, stackTrace) => ChatError(error.toString()),
    //   );
    // });

    on<LoadMessagesEvent>((event, emit) async {
      await emit.forEach<List<Message>>(
        getMessages(event.chatId),
        onData: (messages) => MessagesLoaded(messages),
        onError: (error, stackTrace) => ChatError(error.toString()),
      );
    });

    on<SendMessageEvent>((event, emit) async {
      try {
        await sendMessage(event.chatId, event.message);
      } catch (e) {
        emit(ChatError(e.toString()));
      }
    });
  }

  FutureOr<void> initialEvent(
      InitialEvent event, Emitter<ChatState> emit) async {
    emit(LoadingDataState());
    try {
      await emit.forEach<List<Chat>>(getChats(),
          onData: (chats) => ChatsLoaded(chats));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  FutureOr<void> messageButtonClickedEvent(
      MessageButtonClickedEvent event, Emitter<ChatState> emit) async {
    emit(NavigateToChatScreen(phoneNumber: event.phoneNumber));
    emit(LoadingDataState());
    try {
      await emit.forEach<List<Message>>(
        getMessages(event.chatId),
        onData: (messages) => MessagesLoaded(messages),
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
