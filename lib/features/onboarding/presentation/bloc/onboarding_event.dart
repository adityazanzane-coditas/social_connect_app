part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {}

final class OnNavButtonClickedEvent extends OnboardingEvent {
  final bool isLastPage;

  OnNavButtonClickedEvent({required this.isLastPage});
}

final class OnGetStartedButtonClickedEvent extends OnboardingEvent {}

final class OnSkipButtonClickedEvent extends OnboardingEvent {}
