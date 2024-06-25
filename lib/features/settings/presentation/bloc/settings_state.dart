// part of 'settings_bloc.dart';

// sealed class ProfileState extends Equatable {
//   const ProfileState();
  
//   @override
//   List<Object> get props => [];
// }

// final class SettingsInitial extends ProfileState {}
part of 'settings_bloc.dart';

@immutable
sealed class SettingsState {}

class SettingsInitial extends SettingsState {}


class ShowLanguageDialogState extends SettingsState{
}

class ShowLoginScreenState extends SettingsState{}

class SelectedLanState extends SettingsState{}

class ShowLnaguageDialogState extends SettingsState{}

class ChangeLangugaeState extends SettingsState {
  final int selectedIndex;

   ChangeLangugaeState(this.selectedIndex);


}


