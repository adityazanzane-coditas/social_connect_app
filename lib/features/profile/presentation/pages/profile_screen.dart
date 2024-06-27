import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/profile/data/datasourec/firebase_datasource.dart';
import 'package:social_connect_app/features/profile/data/model/profile_model.dart';
import 'package:social_connect_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_connect_app/features/profile/presentation/widgets/change_bio_bottom_sheet.dart';
import 'package:social_connect_app/features/profile/presentation/widgets/change_profile%20_pic.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final Fonts fonts = Fonts();
  final FirebaseDatasource firebaseDatasource = FirebaseDatasource();

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
            // 'awk-wardly',
            AppLocalizations.of(context)!.awkwardly,
            style: fonts.alata(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: ColorPallete.blueColor),
          ),
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        //  listenWhen: (previous, current) =>  current is ShowBottomModalSheetState,

        listener: (context, state) {
          if (state is ShowBottomModalSheetState) {
            log('state capture');
            showModalBottomSheet(
              backgroundColor: ColorPallete.orangeColor,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return BioEditBottomSheet(
                  currentBio: state.newBio,
                  onSave: (newBio) {
                    firebaseDatasource.updateProfileBio(newBio);
                  },
                );
              },
            );
            log('state executed');
          } else if (state is ShowImagePickerOptionState) {
            showImagePickerOption(context);

            print('after state emit');
          }
        },
        child: StreamBuilder<ProfileModel>(
          stream: firebaseDatasource.getProfile('73x5M7xbusc6I3IlKx0CeANrhdc2'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No profile data found'));
            }

            final profile = snapshot.data!;
            return Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            // height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorPallete.liteOffWhiteTextColor,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                profile.profilePicture,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/icons/profile_emoji.png', 
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  );
                                },
                              ),
                            ),
                            // child: ClipOval(
                            //   child: Image.network(
                            //     profile.profilePicture,
                            //     fit: BoxFit.cover,
                            //     width: 100,
                            //     height: 100,
                            //   ),
                            // ),
                          ),
                          Positioned(
                            right: 5,
                            top: 65,
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<ProfileBloc>(context)
                                    .add(ShowImagePickerOptionEvent());
                                print('after event emit');
                                print(profile.profilePicture);
                       
                              },
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    ColorPallete.faintBlackTextColor,
                                child: SvgPicture.asset(
                                    'assets/icons/edit_pencil.svg'),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 24),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   overflow: TextOverflow.ellipsis,
                            //   profile.userName.toString(),
                            //   style: fonts.alata(
                            //     fontSize: 25,
                            //     fontWeight: FontWeight.w400,
                            //     color: ColorPallete.faintBlackTextColor,
                            //   ),
                            // ),
                            Text(
                              profile.phoneNumber.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: fonts.popins(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: ColorPallete.offWhiteOffTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    flex: 40,
                    child: SizedBox(),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 6),
                        child: Text(
                          textAlign: TextAlign.left,
                          profile.bio.toString(),
                          style: fonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorPallete.purpleButtonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    flex: 25,
                    child: SizedBox(),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            BlocProvider.of<ProfileBloc>(context).add(
                                ShowBottomModalSheetEvent(newBio: profile.bio));
                            log('event added');
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 8),
                            child: SvgPicture.asset(
                              'assets/icons/edit.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          label: Text(
                            // 'Change Bio',
                            AppLocalizations.of(context)!.changeBio,
                            style: fonts.alata(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.purpleButtonColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const Expanded(
                  //   flex: 553,
                  //   child: SizedBox(),
                  // ),
                  SizedBox(height: 553,)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:social_connect_app/core/theme/color_pallete.dart';
// import 'package:social_connect_app/core/theme/fonts.dart';
// import 'package:social_connect_app/features/profile/data/datasourec/firebase_datasource.dart';
// import 'package:social_connect_app/features/profile/data/model/profile_model.dart';

// class ProfileScreen extends StatelessWidget {
//   ProfileScreen({super.key});
//   final Fonts fonts = Fonts();
//   final FirebaseDatasource firebaseDatasource = FirebaseDatasource();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorPallete.backgroundColor,
//       appBar: AppBar(
//         backgroundColor: ColorPallete.backgroundColor,
//         title: Padding(
//           padding:
//               const EdgeInsets.only(left: 10, top: 24, right: 24, bottom: 32),
//           child: Text(
//             'awk-wardly',
//             style: fonts.alata(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w400,
//                 color: ColorPallete.blueColor),
//           ),
//         ),
//       ),
//       body: StreamBuilder<ProfileModel>(
//         stream: firebaseDatasource.getProfile(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('No profile data found'));
//           }

//           final profile = snapshot.data!;
//           return Container(
//             padding: const EdgeInsets.only(left: 24, right: 24, top: 0),
//             child: Column(
//               children: [
//                 SizedBox(height: 24),
//                 Row(
//                   children: [
//                     Stack(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorPallete.liteOffWhiteTextColor,
//                           ),
//                           child: ClipOval(
//                             child: Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(32.0),
//                                 child: Image.asset('assets/icons/profile_emoji.png'),
//                                 // SvgPicture.asset(
//                                 //   'assets/icons/profile_emoji.png',
//                                 //   fit: BoxFit.contain,
//                                 // ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           right:5,
//                           // bottom: 0,
//                           top: 65,
//                           child: CircleAvatar(
//                             radius: 18,
//                             backgroundColor: ColorPallete.faintBlackTextColor,
//                             child: SvgPicture.asset(
//                                 'assets/icons/edit_pencil.svg'),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(width: 24),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.5,
//                       child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           overflow: TextOverflow.ellipsis,
//                           profile.userName.toString(),
//                           style: fonts.alata(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w400,
//                             color: ColorPallete.faintBlackTextColor,
//                           ),
//                         ),
//                         Text(
//                           profile.phoneNumber.toString(),
//                           overflow: TextOverflow.ellipsis,
//                           style: fonts.popins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w300,
//                             color: ColorPallete.offWhiteOffTextColor,
//                           ),
//                         ),
//                       ],
//                                             ),
//                     ),
//                   ],
//                 ),
//                 const Expanded(
//                   flex: 40,
//                   child: SizedBox(),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12, right: 6),
//                   child: Text(
//                     textAlign: TextAlign.left,
//                     profile.bio.toString(),
//                     style: fonts.nunitoSans(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: ColorPallete.purpleButtonColor,
//                     ),
//                   ),
//                 ),
//                 const Expanded(
//                   flex: 25,
//                   child: SizedBox(),
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       child: ElevatedButton.icon(
//                         onPressed: () {
                          
//                         },
//                         icon: Padding(
//                           padding: EdgeInsets.only(left: 0, right: 8),
//                           child: SvgPicture.asset(
//                             'assets/icons/edit.svg',
//                             width: 24,
//                             height: 24,
//                           ),
//                         ),
//                         label: Text(
//                           'Change Bio',
//                           style: fonts.alata(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ColorPallete.purpleButtonColor,
//                           // padding: EdgeInsets.only(left: 20, right: 20,),
//                           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5)
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   flex: 553,
//                   child: SizedBox(),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




