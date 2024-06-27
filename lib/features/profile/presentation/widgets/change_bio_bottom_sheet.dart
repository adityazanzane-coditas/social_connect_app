import 'package:flutter/material.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';

class BioEditBottomSheet extends StatefulWidget {
  final String currentBio;
  final void Function(String newBio) onSave;

  BioEditBottomSheet({required this.currentBio, required this.onSave});

  @override
  _BioEditBottomSheetState createState() => _BioEditBottomSheetState();
}

class _BioEditBottomSheetState extends State<BioEditBottomSheet> {
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _bioController = TextEditingController(text: widget.currentBio);
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final Fonts fonts = Fonts();

    return Padding(
      padding: EdgeInsets.only(
          left: 16.0, right: 16.0, bottom: bottomInset, top: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(

              controller: _bioController,
              maxLines: 8,
              maxLength: 600,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintStyle: fonts.popins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.faintBlackTextColor,
                ),
                hintText: 'Enter your bio',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  widget.onSave(_bioController.text);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Submit',
                  style: fonts.popins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorPallete.whiteColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.purpleButtonColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
