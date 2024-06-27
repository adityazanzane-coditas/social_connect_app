import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/messages/domain/entities/message.dart';
import 'package:social_connect_app/features/messages/presentation/widgets/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  final String phoneNumber;

  const ChatMessages({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    final currentUserPhoneNumber = authenticatedUser.phoneNumber ?? '';
    final chatRoomId = getChatRoomId(currentUserPhoneNumber, phoneNumber);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatRoomId)
          .collection('messages')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
          return Center(
              child: Text(
            'No messages yet.',
            style: Fonts.alata(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ));
        }

        final loadedMessages = chatSnapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Message(
            id: doc.id,
            text: data['text'],
            createdAt: (data['createdAt'] as Timestamp).toDate(),
            phoneNumber: data['phoneNumber'],
            userImage: data['imageUrl'] ?? '',
            isRead: data['isRead'] ?? false,
          );
        }).toList();

        return _buildMessageList(loadedMessages, currentUserPhoneNumber);
      },
    );
  }

  Widget _buildMessageList(
      List<Message> messages, String currentUserPhoneNumber) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (ctx, index) {
        final message = messages[index];
        final nextMessage =
            index + 1 < messages.length ? messages[index + 1] : null;

        final nextUserIsSame = nextMessage != null &&
            nextMessage.phoneNumber == message.phoneNumber;

        if (nextUserIsSame) {
          return MessageBubble.next(
            message: message.text,
            isMe: currentUserPhoneNumber == message.phoneNumber,
          );
        } else {
          return MessageBubble.first(
            // userImage: message.userImage,
            phoneNumber: message.phoneNumber,
            message: message.text,
            isMe: currentUserPhoneNumber == message.phoneNumber,
          );
        }
      },
    );
  }

  String getChatRoomId(String phone1, String phone2) {
    if (phone1.compareTo(phone2) > 0) {
      return '$phone1-$phone2';
    } else {
      return '$phone2-$phone1';
    }
  }
}
