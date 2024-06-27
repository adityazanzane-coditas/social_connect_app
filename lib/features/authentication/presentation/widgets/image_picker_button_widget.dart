import 'package:flutter/material.dart';

import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';

class ImagePickerButtonWidget extends StatelessWidget {
  const ImagePickerButtonWidget(
      {super.key,
      required this.icon,
      required this.type,
      required this.showImagePicker});

  final Icon icon;
  final String type;
  final Future<void> Function(String type) showImagePicker;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            icon: icon,
            onPressed: () async {
              await showImagePicker(type);
            }),
        const SizedBox(height: 8),
        Text(
          type,
          style: Fonts.alata(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: ColorPallete.blackColor,
          ),
        )
      ],
    );
  }
}
