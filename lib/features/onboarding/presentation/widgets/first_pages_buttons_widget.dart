import 'package:flutter/material.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';

class FirstPageButtonsWidget extends StatelessWidget {
  const FirstPageButtonsWidget(
      {super.key, required this.onNext, required this.onBack});

  final void Function() onNext, onBack;
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
          onPressed: onNext,
          style: FilledButton.styleFrom(
            backgroundColor: ColorPallete.orangeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Text(
              'NEXT',
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
