import 'package:flutter/material.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';

class OtpDigitTextformfield extends StatelessWidget {
  OtpDigitTextformfield(
      {super.key,
      required this.digitEditingController,
      required this.isLast,
      required this.isFirst});
  final TextEditingController digitEditingController;
  final bool isLast, isFirst;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        showCursor: false,
        maxLength: 1,
        keyboardType: TextInputType.number,
        controller: digitEditingController,
        // enabled: isFirst ? true : false,
        onChanged: (value) {
          if (!isLast && value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (!isFirst && value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: ColorPallete.blackColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: ColorPallete.greyColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
