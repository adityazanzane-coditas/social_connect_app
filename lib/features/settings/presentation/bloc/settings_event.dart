// part of 'settings_bloc.dart';

// sealed class SettingsEvent extends Equatable {
//   const SettingsEvent();

//   @override
//   List<Object> get props => [];
// }
part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

class ChooseLanguageEvent extends SettingsEvent {}

class TurnOnDarkThemeEvent extends SettingsEvent {}

class LogoutEvent extends SettingsEvent {}

class LangugageDialogClickedEvent extends SettingsEvent {}

class InitializeSettingsEvent extends SettingsEvent {}


class SelectedLanguageEvent extends SettingsEvent {
    final int selectedIndex;

   SelectedLanguageEvent(this.selectedIndex);
}
