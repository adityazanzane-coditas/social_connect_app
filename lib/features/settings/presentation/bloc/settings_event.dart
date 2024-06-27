


import 'package:flutter/material.dart';

sealed class SettingsEvent{}

class LoadLocalizationEvent extends SettingsEvent{
  final Locale locale;

  LoadLocalizationEvent({required this.locale});
}

class LoadSavedLocalizationEvent extends SettingsEvent{}

class LangugageDialogClickedEvent extends SettingsEvent {}

class ThemeChangedEvent extends  SettingsEvent{
  final bool isDarkModeEnabled;

  ThemeChangedEvent(this.isDarkModeEnabled);
}
