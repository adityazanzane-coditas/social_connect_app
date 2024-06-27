import 'package:social_connect_app/features/messages/data/datasources/firestore_datasource.dart';
import 'package:social_connect_app/features/messages/domain/entities/chat.dart';
import 'package:social_connect_app/features/messages/domain/entities/message.dart';
import 'package:social_connect_app/features/messages/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirestoreDataSource _dataSource;

  ChatRepositoryImpl(this._dataSource);

  @override
  Stream<List<Chat>> getChats() {
    return _dataSource.getChatsStream().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Chat(
          id: doc.id,
          participants: List<String>.from(data['participants']),
          lastMessage: data['lastMessage'],
          lastMessageTime: data['lastMessageTime'].toDate(),
        );
      }).toList();
    });
  }

  @override
  Stream<List<Message>> getMessages(String chatId) {
    return _dataSource.getMessagesStream(chatId).map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Message(
          id: doc.id,
          text: data['text'],
          createdAt: data['createdAt'].toDate(),
          phoneNumber: data['phoneNumber'],
          userImage: data['imageUrl'],
          isRead: data['isRead'],
        );
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(String chatId, Message message) async {
    final messageData = {
      'text': message.text,
      'createdAt': message.createdAt,
      'phoneNumber': message.phoneNumber,
      'imageUrl': message.userImage,
      'isRead': message.isRead,
    };
    await _dataSource.sendMessage(chatId, messageData);
    await _dataSource.updateChatInfo(chatId, {
      'lastMessage': message.text,
      'lastMessageTime': message.createdAt,
    });
  }
}
