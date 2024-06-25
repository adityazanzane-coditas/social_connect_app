import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:social_connect_app/features/settings/presentation/pages/settings_screen.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // body: Center(child: Text('Hiiiii'),),
      // body: ProfileScreen(),
      // body: SettingsScreen(),
      body: ProfileScreen(),

    );
  }
}
