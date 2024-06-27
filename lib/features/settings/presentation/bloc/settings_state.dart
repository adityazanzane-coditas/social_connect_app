

import 'package:flutter/material.dart';



class LanguageState {
  final Locale locale;

  LanguageState({this.locale = const Locale('en') });
}
class ShowLanguageDialogState extends LanguageState{
   ShowLanguageDialogState({required super.locale});
}

//class InitialLanguageState extends LanguageState{}

// part of 'settings_bloc.dart';

// @immutable
// sealed class SettingsState {}

// class SettingsInitial extends SettingsState {}


// class ShowLanguageDialogState extends SettingsState{
// }

// class ShowLoginScreenState extends SettingsState{}

// class SelectedLanState extends SettingsState{}

// class ShowLnaguageDialogState extends SettingsState{}

// class ChangeLangugaeState extends SettingsState {
//   final int selectedIndex;

//    ChangeLangugaeState(this.selectedIndex);


// }


