import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/core/routes/app_router.dart';
import 'package:social_connect_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';

import 'package:social_connect_app/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc()
            ,
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      
        
      ),
      routerConfig: AppRouter().config(),
      ),
    );
  }
}
