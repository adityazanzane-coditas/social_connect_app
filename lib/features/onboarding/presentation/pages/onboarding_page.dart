import 'package:flutter/widgets.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle});

  final String imageUrl, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 52,
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Fonts.alata(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: ColorPallete.titleTextColor,
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: Fonts.alata(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorPallete.titleTextColor.withOpacity(0.8),
            ),
          ),
          const Expanded(
            flex: 5,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}