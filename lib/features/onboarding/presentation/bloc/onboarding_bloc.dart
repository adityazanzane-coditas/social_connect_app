import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {});

    on<OnNavButtonClickedEvent>(onNextButtonClickedEvent);
  }

  FutureOr<void> onNextButtonClickedEvent(
      OnNavButtonClickedEvent event, Emitter<OnboardingState> emit) {
    emit(NavigationState(isLastPage: event.isLastPage));
  }
}
