import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:social_connect_app/features/posts/presentation/bloc/post_bloc.dart';

import 'package:uuid/uuid.dart';

final uuid = Uuid();

class CustomModal extends StatefulWidget {
  const CustomModal({super.key});

  @override
  _CustomModalState createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  File? selectedImage;
  TextEditingController postDescriptionController = TextEditingController();

  @override
  void dispose() {
    postDescriptionController.dispose();
    super.dispose();
  }

  Future<void> onSubmitData(
      BuildContext context, String postText, File? file) async {
    final builderContext = context;

    if (postText.isEmpty) {
      log("Post text is empty, showing dialog.");

      showDialog(
        context: builderContext,
        builder: (builderContext) => AlertDialog(
          title: Text(
            "Invalid Input",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(238, 192, 124, 1),
            ),
          ),
          content: Text(
            "Please fill all the required details",
            style: GoogleFonts.lato(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Okay",
                style: GoogleFonts.lato(),
              ),
            )
          ],
        ),
      );

      log("Dialog should be displayed.");

      return;
    }

    BlocProvider.of<PostBloc>(context).add(LoadingCreatePostEvent());

    log("After Loading event triggered !");

    String imageUrl = "";
    if (file != null) {
      try {
        log("Storing image on firebase storage");

        final ref = FirebaseStorage.instance
            .ref()
            .child('posts_images')
            .child('${uuid.v4()}.jpg');

        log("took reference of firebase ");

        await ref.putFile(file);

        log("Stored image on firebase storage");

        imageUrl = await ref.getDownloadURL();

        log("Post text : $postText\n Image url : $imageUrl");
      } catch (e) {
        log("Error uploading image: $e");
      }
    }

    BlocProvider.of<PostBloc>(context).add(
      CreatePostEvent(context: context, postText: postText, postURL: imageUrl),
    );
  }

  Future<void> chooseImage(ImageSource chooseOption) async {
    final ImagePicker imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(source: chooseOption);

    if (pickedImage == null) {
      log("Image not chosen");
    } else {
      log("Image chosen");
      selectedImage = File(pickedImage.path);
    }
  }

  Future<void> showChooseImageModalSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  chooseImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.photo_size_select_actual_rounded,
                        color: Color.fromRGBO(238, 192, 124, 1), size: 40),
                    Flexible(
                      child: Text(
                        "Gallery",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color.fromRGBO(238, 192, 124, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: () async {
                  chooseImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.camera_alt_rounded,
                      color: Color.fromRGBO(238, 192, 124, 1),
                      size: 40,
                    ),
                    Flexible(
                      child: Text(
                        "Camera",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color.fromRGBO(238, 192, 124, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 30,
                child: SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      alignment: Alignment.topRight,
      // child: Container(
      //   decoration: const BoxDecoration(
      //     color: Color.fromRGBO(238, 192, 124, 1),
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(200),
      //         bottomRight: Radius.circular(0)),
      //   ),
      child: CustomPaint(
        painter: RPSCustomPainter(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              AppBar(
                title: Text(
                  "awk-wardly",
                  style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 33,
                      color: Colors.white),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: const Color.fromRGBO(238, 192, 124, 1),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 20, child: SizedBox()),
              TextField(
                controller: postDescriptionController,
                maxLines: 7,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 23,
                  color: const Color.fromRGBO(238, 192, 124, 1),
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "What’s on your mind...",
                  hintStyle: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 23,
                      color: const Color.fromRGBO(238, 192, 124, 1)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(238, 192, 124, 1),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(238, 192, 124, 1),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(238, 192, 124, 1),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 24,
                child: SizedBox(),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46)),
                    ),
                    onPressed: () {
                      showChooseImageModalSheet(context);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.photo_size_select_actual_rounded,
                          color: Color.fromRGBO(238, 192, 124, 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Add Media",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color.fromRGBO(238, 192, 124, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 10,
                    child: SizedBox(),
                  ),
                  BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case CreatePostState:
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(46)),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              String postText = postDescriptionController.text
                                  .toString()
                                  .trim();
                              log("Post text : $postText");

                              await onSubmitData(
                                  context, postText, selectedImage);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Post",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color.fromRGBO(238, 192, 124, 1),
                              ),
                            ),
                          );

                        case LoadingCreatePostState:
                          log("Loading state ");
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );

                        case PostInitial:
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(46)),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              String postText = postDescriptionController.text
                                  .toString()
                                  .trim();
                              log("Post text : $postText");

                              await onSubmitData(
                                  context, postText, selectedImage);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Post",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color.fromRGBO(238, 192, 124, 1),
                              ),
                            ),
                          );

                        default:
                          return Text("Default State");
                      }
                    },
                  ),
                  const Expanded(flex: 97, child: SizedBox()),
                ],
              ),
              const Expanded(flex: 177, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    Paint paintFill = Paint()
      ..color = ui.Color.fromRGBO(238, 192, 124, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(0, size.height * 0.85);

    // First control point downward
    double controlPointX1 = size.width / 2;
    double controlPointY1 = size.height * 1.1;

    double endPointX1 = size.width;
    double endPointY1 = size.height * 0.95;

    path.quadraticBezierTo(
      controlPointX1,
      controlPointY1,
      endPointX1,
      endPointY1,
    );

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);
    canvas.drawPath(path, paintFill);

    Paint paintStroke = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00;

    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
