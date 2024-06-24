import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

Future<void> chooseImage(ImageSource chooseOption) async {
  print("Method called !!!");

  final ImagePicker imagePicker = ImagePicker();

  final pickedImage = await imagePicker.pickImage(source: chooseOption);

  print("picked image");
  if (pickedImage == null) {
    print("Image can't be choose ");
  } else {
    print("Image choose ");
  }
}

void showChooseImageModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => chooseImage(ImageSource.gallery),
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
              onTap: () => chooseImage(ImageSource.camera),
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

class CustomModal extends StatelessWidget {
  const CustomModal({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController postDescriptionController = TextEditingController();

    String postDescription;
    String imageURL;

    return FractionallySizedBox(
      heightFactor: 0.7,
      alignment: Alignment.topRight,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(238, 192, 124, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const Expanded(flex: 10, child: SizedBox()),
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
                      )),
                ],
              ),
              const Expanded(flex: 20, child: SizedBox()),
              TextField(
                controller: postDescriptionController,
                maxLines: 8,
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
              const Expanded(flex: 24, child: SizedBox()),
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
                  const Expanded(flex: 10, child: SizedBox()),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46)),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (postDescriptionController.text
                          .toString()
                          .trim()
                          .isNotEmpty) {}
                    },
                    child: Text(
                      "Post",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color.fromRGBO(238, 192, 124, 1),
                      ),
                    ),
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
