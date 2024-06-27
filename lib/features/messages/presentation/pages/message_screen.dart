import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_connect_app/core/routes/app_router.gr.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/messages/presentation/pages/add_user_screen.dart';
import 'package:social_connect_app/features/messages/presentation/pages/chat_screen.dart';

@RoutePage()
class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff6E79DC),
        title: Text(
          'Messages',
          style: Fonts.alata(
            fontSize: 23,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddUserScreen()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('participants', arrayContains: currentUser.phoneNumber)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat, color: Colors.grey, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'No conversations yet.',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final chatDoc = snapshot.data!.docs[index];
              final chatData = chatDoc.data() as Map<String, dynamic>;
              final participants = List<String>.from(chatData['participants']);
              final otherParticipant = participants.firstWhere(
                (participant) => participant != currentUser.phoneNumber,
                orElse: () => 'Unknown',
              );

              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('registered_users')
                    .doc(otherParticipant)
                    .get(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xff6E79DC),
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  }

                  // final userData =
                  //     userSnapshot.data?.data() as Map<String, dynamic>?;
                  // final imageUrl = userData?['imageUrl'] as String? ?? '';

                  return ListTile(
                    // leading: CircleAvatar(
                    //   backgroundImage:
                    //       imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                    //   backgroundColor: Colors.blueAccent,
                    //   child: imageUrl.isEmpty
                    //       ? const Icon(Icons.person, color: Colors.white)
                    //       : null,
                    // ),
                    title: Text(
                      otherParticipant,
                      style: Fonts.alata(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      chatData['lastMessage'] ?? 'No messages yet',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.alata(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                    trailing:
                        const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            phoneNumber: otherParticipant,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
