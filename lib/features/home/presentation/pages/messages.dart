import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Msg extends StatelessWidget {
  const Msg({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
      
        children: [Center(child: Text('MSG'),)],
      ),
    );
  }
}