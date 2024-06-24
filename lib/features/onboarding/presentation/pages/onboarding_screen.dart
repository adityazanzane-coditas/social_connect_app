import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_connect_app/core/constants/key_constants.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:social_connect_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:social_connect_app/features/onboarding/presentation/widgets/first_pages_buttons_widget.dart';
import 'package:social_connect_app/features/onboarding/presentation/widgets/last_page_buttons.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingPage> pages = const [
    OnboardingPage(
      imageUrl: 'assets/images/onboarding_image_one.png',
      title: "Connect. Share. Engage.",
      subTitle: "Share your thoughts, photos, and moments in real-time.",
    ),
    OnboardingPage(
      imageUrl: 'assets/images/onboarding_image_two.png',
      title: "Your Social World, Simplified.",
      subTitle:
          " Post updates, photos, and videos with ease, and chat instantly with friends.",
    ),
    OnboardingPage(
      imageUrl: 'assets/images/onboarding_image_three.png',
      title: "Discover. Chat. Grow.",
      subTitle:
          "Discover new interests and expand your social circle in a dynamic environment.",
    )
  ];
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('State Rebuilt');
    return Scaffold(
      backgroundColor: ColorPallete.whiteColor,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 24,
            child: TextButton(
              onPressed: _onSkip,
              child: Text(
                'SKIP',
                style: Fonts.alata(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.offWhiteOffTextColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top + 40,
            ),
            child: PageView(
              pageSnapping: true,
              onPageChanged: (index) => context.read<OnboardingBloc>().add(
                    OnNavButtonClickedEvent(
                      isLastPage: (index == pages.length - 1),
                    ),
                  ),
              controller: _controller,
              children: pages,
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: SlideEffect(
                dotColor: ColorPallete.offWhiteOffTextColor,
                activeDotColor: ColorPallete.orangeColor,
                dotHeight: 4,
                dotWidth: 26,
              ),
              onDotClicked: (index) => _controller.animateToPage(
                index,
                duration: const Duration(microseconds: 350),
                curve: Curves.easeIn,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: BlocConsumer<OnboardingBloc, OnboardingState>(
              listenWhen: (context, state) {
                state as NavigationState;
                return !state.isLastPage;
              },
              // buildWhen: (context, state) {
              //   return state.isLastPage;
              // },
              builder: (context, state) {
                switch (state) {
                  case NavigationState():
                    if (state.isLastPage) {
                      return LastPageButtonsWidgets(
                          onGetStarted: _onGetStarted, onBack: _onBack);
                    } else {
                      return FirstPageButtonsWidget(
                          onBack: _onBack, onNext: _onNext);
                    }
                  case OnboardingInitial():
                    return FirstPageButtonsWidget(
                        onBack: _onBack, onNext: _onNext);
                }
              },
              listener: (BuildContext context, OnboardingState state) {
                switch (state) {
                  case NavigationState():
                    // context.replaceRoute('')
                    break;
                  case OnboardingInitial():
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  //Methods to change the page based on the controllers.
  void _onSkip() => _controller.jumpToPage(pages.length);

  void _onNext() => _controller.nextPage(
      duration: const Duration(milliseconds: 350), curve: Curves.easeIn);

  Future<void> _onGetStarted(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(KeyConstants.LOGIN_KEY, true);
    // context.replace('/home');
  }

  void _onBack() => _controller.previousPage(
      duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
}
