import 'package:flutter/material.dart';
import 'package:social_connect_app/features/posts/presentation/pages/custom_wrapper.dart';

class MyDummyScreen extends StatelessWidget {
  const MyDummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          showCustomModal(context);
        }, child: const Text("Add post")),
      ),
    );
  }
}
