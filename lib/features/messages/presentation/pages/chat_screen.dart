import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/messages/presentation/widgets/chat_messages.dart';
import 'package:social_connect_app/features/messages/presentation/widgets/new_message.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  final String phoneNumber;

  const ChatScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          phoneNumber,
          style: Fonts.alata(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(phoneNumber: phoneNumber),
          ),
          NewMessage(receiverPhoneNumber: phoneNumber),
        ],
      ),
    );
  }
}
