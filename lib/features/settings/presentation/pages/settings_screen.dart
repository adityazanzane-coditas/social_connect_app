
// 2
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:social_connect_app/features/settings/presentation/widgets/select_language_dialog.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorPallete.backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 24, right: 24, bottom: 32),
          child: Text(
            'awk-wardly',
            style: fonts.alata(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: ColorPallete.orangeColor,
            ),
          ),
        ),
      ),
      body: BlocConsumer<SettingsBloc, SettingsState>(
      
             listenWhen: (previous, current) {
        return current is! ShowLnaguageDialogState;
      },
      // buildWhen: (previous, current) {
      //   return current is! ShowLnaguageDialogState;
      // },
        listener: (context, state) {
          log('Listener executed********');
          showLanguageDialog(context);
      
        },
        builder: (context, state) {
          return BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Container(
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
                            'Choose Language',
                            style: fonts.alata(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: ColorPallete.faintBlackTextColor,
                            ),
                          ),
                          onTap: () {
                            log("ListTile tapped");
                            BlocProvider.of<SettingsBloc>(context).add(LangugageDialogClickedEvent());
                          },
                        ),
                        Divider(
                          thickness: 0.7,
                          height: 15,
                          color: ColorPallete.faintBlackTextColor,
                        ),
                        ListTile(
                          leading: SvgPicture.asset('assets/icons/moon.svg'),
                          title: Text(
                            'Turn on dark theme',
                            style: fonts.alata(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: ColorPallete.faintBlackTextColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                        Divider(
                          height: 15,
                          thickness: 0.7,
                          color: ColorPallete.faintBlackTextColor,
                        ),
                        ListTile(
                          leading: SvgPicture.asset('assets/icons/log-out.svg'),
                          title: Text(
                            'Logout',
                            style: fonts.alata(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: ColorPallete.logoutRedColor,
                            ),
                          ),
                          onTap: () {},
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
              );
            },
         
          );
        },
      ),
    );
  }
}






// //1

// // import 'dart:developer';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:social_connect_app/core/theme/color_pallete.dart';
// // import 'package:social_connect_app/core/theme/fonts.dart';
// // import 'package:social_connect_app/features/settings/presentation/bloc/settings_bloc.dart';
// // import 'package:social_connect_app/features/settings/presentation/widgets/select_language_dialog.dart';

// // class SettingsScreen extends StatelessWidget {
// //   SettingsScreen({super.key});
// //   final Fonts fonts = Fonts();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: ColorPallete.backgroundColor,
// //       appBar: AppBar(
// //         backgroundColor: ColorPallete.backgroundColor,
// //         title: Padding(
// //           padding:
// //               const EdgeInsets.only(left: 10, top: 24, right: 24, bottom: 32),
// //           child: Text(
// //             'awk-wardly',
// //             style: fonts.alata(
// //                 fontSize: 32,
// //                 fontWeight: FontWeight.w400,
// //                 color: ColorPallete.orangeColor),
// //           ),
// //         ),
// //       ),
// //       body: BlocConsumer<SettingsBloc, SettingsState>(
// //         // listenWhen: (previous, current) {
// //         //   return current is! ShowLnaguageDialogState;
// //         // },
// //         // buildWhen: (previous, current) {
// //         //   // Add conditions to rebuild the builder
// //         //   return current is! ShowLnaguageDialogState;
// //         // },
// //         listener: (context, state) {
// //           if (state is ShowLnaguageDialogState) {
// //             log("State emitted *****************");
// //             // showLanguageDialog(context);
// //             showLanguageDialog(context);

// //             // return;
// //             // DummyTextScreen();
// //             // MaterialPageRoute(builder: (context) => DummyTextScreen());
// //           }
// //         },
// //         builder: (context, state) {
// //           return BlocBuilder<SettingsBloc, SettingsState>(
// //             builder: (context, state) {
// //               return Container(
// //                 padding: const EdgeInsets.symmetric(horizontal: 24),
// //                 child: ListView(
// //                   // padding: EdgeInsets.only(top: 16),
// //                   children: [
// //                     Column(
// //                       children: [
// //                         const SizedBox(
// //                           height: 24,
// //                         ),
// //                         ListTile(
// //                           leading: SvgPicture.asset('assets/icons/globe.svg'),
// //                           title: Text(
// //                             'Choose Language',
// //                             style: fonts.alata(
// //                                 fontSize: 24,
// //                                 fontWeight: FontWeight.w400,
// //                                 color: ColorPallete.faintBlackTextColor),
// //                           ),
// //                           onTap: () {
// //                             BlocProvider.of<SettingsBloc>(context)
// //                                 .add(LangugageDialogClickedEvent());
// //                           },
// //                         ),

// //                         Divider(
// //                           thickness: 0.7,
// //                           height: 15,
// //                           color: ColorPallete.faintBlackTextColor,
// //                         ),
// //                         ListTile(
// //                           leading: SvgPicture.asset('assets/icons/moon.svg'),
// //                           title: Text(
// //                             'Turn on dark theme',
// //                             style: fonts.alata(
// //                                 fontSize: 24,
// //                                 fontWeight: FontWeight.w400,
// //                                 color: ColorPallete.faintBlackTextColor),
// //                           ),
// //                           onTap: () {},
// //                         ),
// //                         Divider(
// //                           height: 15,
// //                           thickness: 0.7,
// //                           color: ColorPallete.faintBlackTextColor,
// //                         ),
// //                         ListTile(
// //                           leading: SvgPicture.asset('assets/icons/log-out.svg'),
// //                           title: Text(
// //                             'Logout',
// //                             style: fonts.alata(
// //                                 fontSize: 24,
// //                                 fontWeight: FontWeight.w400,
// //                                 color: ColorPallete.logoutRedColor),
// //                           ),
// //                           onTap: () {},
// //                         ),
// //                         Divider(
// //                           thickness: 0.7,
// //                           height: 15,
// //                           color: ColorPallete.faintBlackTextColor,
// //                         ),
// //                         // Text(
// //                         //   'Choose Language',
// //                         //   style: fonts.alata(
// //                         //       fontSize: 32,
// //                         //       fontWeight: FontWeight.w400,
// //                         //       color: ColorPallete.orangeColor),
// //                         // ),
// //                         // Text(
// //                         //   'Turn on dark theme',
// //                         //   style: fonts.alata(
// //                         //       fontSize: 32,
// //                         //       fontWeight: FontWeight.w400,
// //                         //       color: ColorPallete.orangeColor),
// //                         // ),
// //                         // Text(
// //                         //   'Logout',
// //                         //   style: fonts.alata(
// //                         //       fontSize: 32,
// //                         //       fontWeight: FontWeight.w400,
// //                         //       color: ColorPallete.orangeColor),
// //                         // ),
// //                         SizedBox(
// //                           height: 519,
// //                         )
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
