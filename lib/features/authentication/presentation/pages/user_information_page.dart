import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_connect_app/core/routes/app_router.gr.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/authentication/data/models/user_model.dart';
import 'package:social_connect_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:social_connect_app/features/authentication/presentation/widgets/image_picker_button_widget.dart';

@RoutePage()
class UserInformationPage extends StatefulWidget {
  const UserInformationPage(
      {super.key, required this.phoneNumber, required this.uid});

  final String phoneNumber, uid;

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  File? _pickedImageFile;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController textController = TextEditingController();

  final TextStyle _textStyle = Fonts.alata(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ColorPallete.blackColor);

  Future<void> pickImage(String type) async {
    final pickedImage = await ImagePicker().pickImage(
      source: type == "Camera" ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage != null) {
      setState(() {
        _pickedImageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.whiteColor,
      appBar: AppBar(
        title: Text(
          'Awk-wardly',
          style: Fonts.alata(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: ColorPallete.blackColor,
          ),
        ),
        backgroundColor: ColorPallete.whiteColor,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessSavingNewUserState) {
            context.router.replaceAll(
              [
                const HomeRoute(),
              ],
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Let's setup your profile",
                    style: Fonts.alata(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: ColorPallete.blackColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Set Profile Picture',
                  style: _textStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: _pickedImageFile != null
                            ? FileImage(_pickedImageFile!)
                            : const AssetImage(
                                    "assets/images/profile_picture_one.png")
                                as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          iconSize: 34,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorPallete.whiteColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ImagePickerButtonWidget(
                                      icon:
                                          const Icon(Icons.camera_alt_rounded),
                                      type: "Camera",
                                      showImagePicker: pickImage,
                                    ),
                                    ImagePickerButtonWidget(
                                      icon: const Icon(
                                          Icons.add_photo_alternate_sharp),
                                      type: "Files",
                                      showImagePicker: pickImage,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: ColorPallete.orangeColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Add bio',
                  style: _textStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: textController,
                        maxLines: null,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPallete.blackColor,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintStyle: Fonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: ColorPallete.blackColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPallete.blackColor,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Enter your bio',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bio Cannot be empty';
                          }
                          if (value.length < 10) {
                            return 'Bio must be at least 10 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,

                        // child: ElevatedButton(
                        //   onPressed: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       print("Done");
                        //       UserModel user = UserModel(
                        //         bio: textController.text.trim(),
                        //         phoneNumber: widget.phoneNumber,
                        //         imageUrl: "",
                        //         uid: widget.uid,
                        //       );
                        //       context.read<AuthBloc>().add(
                        //             OnSaveNewUserProfileButtonClickedEvent(
                        //                 user: user,
                        //                 context: context,
                        //                 pickedImage: _pickedImageFile),
                        //           );
                        //     }
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: ColorPallete.orangeColor,
                        //     shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(16),
                        //       ),
                        //     ),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(vertical: 16),
                        //     child: Text(
                        //       "Save",
                        //       style: Fonts.alata(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w600,
                        //         color: ColorPallete.whiteColor,
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            switch (state) {
                              case SuccessSavingNewUserState():
                                return ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  child: const CircularProgressIndicator(),
                                );
                              case LoadingAuthState():
                                return ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  child: const CircularProgressIndicator(),
                                );
                              case ErrorSavingNewUserState():
                                return ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print("Done");
                                      UserModel user = UserModel(
                                        bio: textController.text.trim(),
                                        phoneNumber: widget.phoneNumber,
                                        imageUrl: "",
                                        uid: widget.uid,
                                      );
                                      context.read<AuthBloc>().add(
                                            OnSaveNewUserProfileButtonClickedEvent(
                                                user: user,
                                                context: context,
                                                pickedImage: _pickedImageFile),
                                          );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorPallete.orangeColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Text(
                                      "Save",
                                      style: Fonts.alata(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallete.whiteColor,
                                      ),
                                    ),
                                  ),
                                );
                              default:
                                return ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print("Done");
                                      UserModel user = UserModel(
                                        bio: textController.text.trim(),
                                        phoneNumber: widget.phoneNumber,
                                        imageUrl: "",
                                        uid: widget.uid,
                                      );
                                      context.read<AuthBloc>().add(
                                            OnSaveNewUserProfileButtonClickedEvent(
                                                user: user,
                                                context: context,
                                                pickedImage: _pickedImageFile),
                                          );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorPallete.orangeColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Text(
                                      "Save",
                                      style: Fonts.alata(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ColorPallete.whiteColor,
                                      ),
                                    ),
                                  ),
                                );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
