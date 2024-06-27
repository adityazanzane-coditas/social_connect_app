


import 'package:flutter/material.dart';

sealed class LanguageEvent{}

class LoadLocalizationEvent extends LanguageEvent{
  final Locale locale;

  LoadLocalizationEvent({required this.locale});
}

class LoadSavedLocalizationEvent extends LanguageEvent{}

class LangugageDialogClickedEvent extends LanguageEvent {}

// part of 'settings_bloc.dart';

// @immutable
// sealed class SettingsEvent {}

// class ChooseLanguageEvent extends SettingsEvent {}

// class TurnOnDarkThemeEvent extends SettingsEvent {}

// class LogoutEvent extends SettingsEvent {}

// class LangugageDialogClickedEvent extends SettingsEvent {}

// class InitializeSettingsEvent extends SettingsEvent {}


// class SelectedLanguageEvent extends SettingsEvent {
//     final int selectedIndex;

//    SelectedLanguageEvent(this.selectedIndex);
// }
