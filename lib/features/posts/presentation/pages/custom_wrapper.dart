import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_connect_app/features/posts/presentation/pages/create_post_screen.dart';

void showCustomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CustomModalWrapper();
    },
  );
}

class CustomModalWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
        ),
        
        Align(
          alignment: Alignment.topRight,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, -1.0), // Start from top right
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.easeInOut,
              ),
            ),
            child: CustomModal(),
          ),
        ),
      ],
    );
  }
}
