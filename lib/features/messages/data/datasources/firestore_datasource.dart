import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getChatsStream() {
    final currentUser = _auth.currentUser!;
    return _firestore
        .collection('chats')
        .where('participants', arrayContains: currentUser.phoneNumber)
        .snapshots();
  }

  Future<QuerySnapshot> getUserByPhoneNumber(String phoneNumber) {
    return _firestore
        .collection('registered_users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
  }

  Stream<QuerySnapshot> getMessagesStream(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> sendMessage(String chatId, Map<String, dynamic> messageData) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(messageData);
  }

  Future<void> updateChatInfo(String chatId, Map<String, dynamic> chatData) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .set(chatData, SetOptions(merge: true));
  }
}
