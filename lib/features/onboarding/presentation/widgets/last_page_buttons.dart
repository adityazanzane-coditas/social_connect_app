import 'package:flutter/material.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';

class LastPageButtonsWidgets extends StatelessWidget {
  const LastPageButtonsWidgets(
      {super.key, required this.onGetStarted, required this.onBack});

  final void Function(BuildContext context) onGetStarted;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 24,
        ),
        TextButton(
          onPressed: onBack,
          child: Text(
            'BACK',
            style: Fonts.alata(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorPallete.offWhiteOffTextColor,
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        FilledButton(
          onPressed: () {
            return onGetStarted(context);
          },
          style: FilledButton.styleFrom(
            backgroundColor: ColorPallete.orangeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Text(
              'GET STARTED',
              style: Fonts.alata(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorPallete.whiteColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
