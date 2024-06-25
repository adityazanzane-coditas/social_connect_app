import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/core/routes/app_router.dart';
import 'package:social_connect_app/features/profile/data/datasourec/firebase_datasource.dart';
import 'package:social_connect_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:social_connect_app/firebase_options.dart';

void main() async {
  setup();

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
        // BlocProvider(
        //   create: (_) => ProfileBloc(),
        // ),
         BlocProvider(
          create: (_) => ProfileBloc(),
        ),
        BlocProvider(
          create: (_) => SettingsBloc(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().config(),
      ),
    );
  }
}
