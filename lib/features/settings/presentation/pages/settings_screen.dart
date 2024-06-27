import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/profile/presentation/widgets/change_profile%20_pic.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_event.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_state.dart';
import 'package:social_connect_app/features/settings/presentation/widgets/choose_lang_alert_dialog.dart';
import 'package:social_connect_app/features/settings/presentation/widgets/select_language_dialog.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final Fonts fonts = Fonts();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorPallete.backgroundColor,
        title: Padding(
          padding:
              const EdgeInsets.only(left: 10, top: 24, right: 24, bottom: 32),
          child: Text(
            AppLocalizations.of(context)!.awkwardly,
            style: fonts.alata(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: ColorPallete.orangeColor,
            ),
          ),
        ),
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case ShowLanguageDialogState:
              log("after showdialog");
              showDialog(
                context: context,
                builder: (context) => LanguageSelectionDialog(),
              );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/icons/globe.svg'),
                    title: Text(
                      // 'Choose Language',
                      AppLocalizations.of(context)!.chooseLanguage,

                      style: fonts.alata(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: ColorPallete.faintBlackTextColor,
                      ),
                    ),
                    onTap: () {
                      BlocProvider.of<SettingsBloc>(context)
                          .add(LangugageDialogClickedEvent());
                      print('Event exe');
                    },
                  ),
                  Divider(
                    thickness: 0.7,
                    height: 15,
                    color: ColorPallete.faintBlackTextColor,
                  ),
                  // ListTile(
                  //   leading: SvgPicture.asset('assets/icons/moon.svg'),
                  //   title: Text(
                  //     AppLocalizations.of(context)!.turnOnDarkTheme,

                  //     style: fonts.alata(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.w400,
                  //       color: ColorPallete.faintBlackTextColor,
                  //     ),
                  //   ),
                  //   onTap: () {},
                  // ),
                  Divider(
                    height: 15,
                    thickness: 0.7,
                    color: ColorPallete.faintBlackTextColor,
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/icons/log-out.svg'),
                    title: Text(
                      // 'Logout',
                      AppLocalizations.of(context)!.logout,

                      style: fonts.alata(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: ColorPallete.logoutRedColor,
                      ),
                    ),
                    onTap: () async {
                      _firebaseAuth.signOut();
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setBool('hasOnboardedOnce', false);
                    },
                  ),
                  Divider(
                    thickness: 0.7,
                    height: 15,
                    color: ColorPallete.faintBlackTextColor,
                  ),
                  SizedBox(
                    height: 519,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

