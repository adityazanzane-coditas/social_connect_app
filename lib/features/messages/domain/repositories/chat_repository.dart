import 'package:social_connect_app/features/messages/domain/entities/chat.dart';
import 'package:social_connect_app/features/messages/domain/entities/message.dart';

abstract class ChatRepository {
  Stream<List<Chat>> getChats();
  Stream<List<Message>> getMessages(String chatId);
  Future<void> sendMessage(String chatId, Message message);
}