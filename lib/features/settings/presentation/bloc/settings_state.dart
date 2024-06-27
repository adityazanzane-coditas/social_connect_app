

import 'package:flutter/material.dart';



class SettingsState {
  final Locale locale;

  SettingsState({this.locale = const Locale('en') });
}
class ShowLanguageDialogState extends SettingsState{
   ShowLanguageDialogState({required super.locale});
}


class ChangeThemeState extends SettingsState {
  final bool isDarkModeEnabled;

  ChangeThemeState({this.isDarkModeEnabled = false});

  
}
