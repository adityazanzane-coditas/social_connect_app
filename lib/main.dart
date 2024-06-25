import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/features/posts/presentation/bloc/post_bloc.dart';
import 'package:social_connect_app/features/posts/presentation/pages/dummy_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Dem',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyDummyScreen(),
      ),
    );
  }
}
