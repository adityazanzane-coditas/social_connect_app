part of 'profile_bloc.dart';

sealed class ProfileState{
  const ProfileState();
  

}

final class ProfileInitial extends ProfileState {}



class ShowBottomModalSheetState extends ProfileState{
    final String newBio;

  ShowBottomModalSheetState({required this.newBio});
}

class ShowImagePickerOptionState extends ProfileState {}

