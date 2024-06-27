import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_event.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_state.dart';




class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
    on<LangugageDialogClickedEvent>(langugageDialogClickedEvent);

    on<LoadLocalizationEvent>(loadLocalizationEvent);
    on<LoadSavedLocalizationEvent>(loadSavedLocalizationEvent);
  }

  FutureOr<void> loadLocalizationEvent(
      LoadLocalizationEvent event, Emitter emit) async {
    if (event.locale == state.locale) return;
    print('-----${event.locale}');
    print('-----${state.locale}');
    saveLocale(event.locale);
    emit(LanguageState(locale: event.locale));
  }

  FutureOr<void> langugageDialogClickedEvent(
      LangugageDialogClickedEvent event, Emitter<LanguageState> emit) {
    log("Choose language event called ***************");
    emit(ShowLanguageDialogState(locale: state.locale));
    log(" ***************");
  }

  FutureOr<void> loadSavedLocalizationEvent(
      LoadSavedLocalizationEvent event, Emitter emit) async {
    Locale saveLocale = await getLocale();
    emit(LanguageState(locale: saveLocale));
  }

  saveLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'en';
    print(languageCode);
    return Locale(languageCode);
  }
}


// class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
//   SettingsBloc() : super(SettingsInitial()) {
//     // on<SettingsEvent>((event, emit) {
//     on<SelectedLanguageEvent>(selectedLanguageEvent);

//     // });
//         // on<>(langugageDialogClickedEvent);
//     // on<SettingsInitial>(settingsInitial);
//     on<LangugageDialogClickedEvent>(langugageDialogClickedEvent);
//   }

//   FutureOr<void> langugageDialogClickedEvent(LangugageDialogClickedEvent event, Emitter<SettingsState> emit) {
//   log("Choose language event called ***************");
//     emit(ShowLanguageDialogState());
//       log(" ***************");

//   }
// FutureOr<void> selectedLanguageEvent(SelectedLanguageEvent event, Emitter<SettingsState> emit) {
//         emit(ChangeLangugaeState(event.selectedIndex));

//   }
//   // FutureOr<void> settingsInitial(SettingsInitial event, Emitter<SettingsState> emit) {
//   // }
// }

