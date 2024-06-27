
import 'package:social_connect_app/features/messages/domain/entities/message.dart';
import 'package:social_connect_app/features/messages/domain/repositories/chat_repository.dart';

class GetMessages {
  final ChatRepository repository;

  GetMessages(this.repository);

  Stream<List<Message>> call(String chatId) {
    return repository.getMessages(chatId);
  }
}