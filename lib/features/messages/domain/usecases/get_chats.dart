

import 'package:social_connect_app/features/messages/domain/entities/chat.dart';
import 'package:social_connect_app/features/messages/domain/repositories/chat_repository.dart';

class GetChats {
  final ChatRepository repository;

  GetChats(this.repository);

  Stream<List<Chat>> call() {
    return repository.getChats();
  }
}