import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';



class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    // on<SettingsEvent>((event, emit) {
    on<SelectedLanguageEvent>(selectedLanguageEvent);

    // });
        // on<>(langugageDialogClickedEvent);
    // on<SettingsInitial>(settingsInitial);
    on<LangugageDialogClickedEvent>(langugageDialogClickedEvent);
  }

  FutureOr<void> langugageDialogClickedEvent(LangugageDialogClickedEvent event, Emitter<SettingsState> emit) {
  log("Choose language event called ***************");
    emit(ShowLanguageDialogState());
      log(" ***************");

  }
FutureOr<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<SettingsState> emit) {
        emit(ChangeLangugaeState(event.selectedIndex));

  }
  // FutureOr<void> settingsInitial(SettingsInitial event, Emitter<SettingsState> emit) {
  // }
}

