import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/core/routes/app_router.dart';
import 'package:social_connect_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:social_connect_app/features/messages/data/datasources/firestore_datasource.dart';
import 'package:social_connect_app/features/messages/data/repositories/chat_repository_impl.dart';
import 'package:social_connect_app/features/messages/domain/usecases/get_chats.dart';
import 'package:social_connect_app/features/messages/domain/usecases/get_messages.dart';
import 'package:social_connect_app/features/messages/domain/usecases/send_message.dart';
import 'package:social_connect_app/features/messages/presentation/bloc/chat_bloc.dart';
import 'package:social_connect_app/features/messages/presentation/bloc/chat_event.dart';
import 'package:social_connect_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:social_connect_app/features/posts/presentation/bloc/post_bloc.dart';

import 'package:social_connect_app/firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
  );

  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            getChats: GetChats(
              ChatRepositoryImpl(
                FirestoreDataSource(),
              ),
            ),
            getMessages: GetMessages(
              ChatRepositoryImpl(
                FirestoreDataSource(),
              ),
            ),
            sendMessage: SendMessage(
              ChatRepositoryImpl(
                FirestoreDataSource(),
              ),
            ),
          )..add(InitialEvent()),),
        BlocProvider(
          create: (context) => PostBloc(),
        ),
      ],
      child: MaterialApp.router(
        key: GlobalKey<NavigatorState>(),
        theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      
        
      ),
      routerConfig: _appRouter.config(),
      ),
    );
  }
}
