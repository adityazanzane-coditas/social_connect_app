part of 'onboarding_bloc.dart';

sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class NavigationState extends OnboardingState {
  final bool isLastPage;

  NavigationState({required this.isLastPage});
}
