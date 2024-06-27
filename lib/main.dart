import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/core/routes/app_router.dart';
import 'package:social_connect_app/features/profile/data/datasourec/firebase_datasource.dart';
import 'package:social_connect_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_event.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_state.dart';
import 'package:social_connect_app/firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        BlocProvider<SettingsBloc>(
            create: (context) =>
                SettingsBloc()..add(LoadSavedLocalizationEvent())),

        BlocProvider(
          create: (_) => ProfileBloc(),
        ),
     
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) => current is !ShowLanguageDialogState,
        
        builder: (context, state) {
          return MaterialApp.router(
            locale: state.locale,
       
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: AppRouter().config(),
          );
        },
      ),
    );
  }
}
