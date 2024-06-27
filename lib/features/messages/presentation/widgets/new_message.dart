import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/messages/domain/entities/message.dart';
import 'package:social_connect_app/features/messages/presentation/bloc/chat_bloc.dart';
import 'package:social_connect_app/features/messages/presentation/bloc/chat_event.dart';

class NewMessage extends StatefulWidget {
  final String receiverPhoneNumber;

  const NewMessage({super.key, required this.receiverPhoneNumber});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    setState(() {
      _isSending = true;
    });

    FocusScope.of(context).unfocus();
    _messageController.clear();

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User is not authenticated');
      }

      final chatRoomId =
          getChatRoomId(user.phoneNumber!, widget.receiverPhoneNumber);

      final message = Message(
        id: '', // This will be set by Firestore
        text: enteredMessage,
        createdAt: DateTime.now(),
        phoneNumber: user.phoneNumber!,
        userImage: '', // You might want to fetch this from the user's profile
        isRead: false,
      );

      // Send the message
      context.read<ChatBloc>().add(SendMessageEvent(chatRoomId, message));

      // Update the chat summary
      await FirebaseFirestore.instance.collection('chats').doc(chatRoomId).set({
        'participants': [user.phoneNumber, widget.receiverPhoneNumber],
        'lastMessage': enteredMessage,
        'lastMessageTimestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send message: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  String getChatRoomId(String user1, String user2) {
    if (user1.compareTo(user2) > 0) {
      return '$user1-$user2';
    } else {
      return '$user2-$user1';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              minLines: 1,
              maxLines: null,
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              style: Fonts.alata(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Type a message',
                hintStyle: Fonts.alata(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.black, width: 12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          IconButton(
            onPressed: _isSending ? null : _submitMessage,
            icon: _isSending
                ? const Icon(Icons.send)
                : const Icon(Icons.send_rounded),
          )
        ],
      ),
    );
  }
}
