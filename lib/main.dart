import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/core/routes/app_router.dart';
import 'package:social_connect_app/firebase_options.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().config(),
    );
  }
}