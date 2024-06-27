import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/messages/presentation/pages/chat_screen.dart';

@RoutePage()
class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff6E79DC),
        title: Text(
          'Add User',
          style: Fonts.alata(
            fontSize: 23,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(30),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search user',
                  hintStyle: Fonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('registered_users')
                  .snapshots(),
              builder: (ctx, usersSnapshot) {
                if (usersSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!usersSnapshot.hasData ||
                    usersSnapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_search, color: Colors.grey, size: 64),
                        SizedBox(height: 16),
                        Text(
                          'No users found.',
                          style: Fonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final users = usersSnapshot.data!.docs;
                final filteredUsers = users.where((user) {
                  final userData = user.data() as Map<String, dynamic>;
                  final phoneNumber =
                      userData['phoneNumber']?.toString().toLowerCase() ?? '';
                  return phoneNumber.contains(_searchQuery);
                }).toList();

                if (filteredUsers.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_off, color: Colors.grey, size: 64),
                        SizedBox(height: 16),
                        Text(
                          'No matching users found.',
                          style: Fonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (ctx, index) {
                    final userData =
                        filteredUsers[index].data() as Map<String, dynamic>;
                    final phoneNumber = userData['phoneNumber'] ?? 'Unknown';
                    final imageUrl = userData['imageUrl'] ?? '';

                    if (phoneNumber == currentUser.phoneNumber) {
                      return Container();
                    }

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                        backgroundColor: Colors.blueAccent,
                        child: imageUrl.isEmpty
                            ? const Icon(Icons.person, color: Colors.white)
                            : null,
                      ),
                      title: Text(
                        phoneNumber,
                        style: Fonts.alata(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              phoneNumber: phoneNumber,
                            ),
                          ),
                        );
                        // context.router
                        //     .replace(ChatRoute(phoneNumber: phoneNumber));
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
