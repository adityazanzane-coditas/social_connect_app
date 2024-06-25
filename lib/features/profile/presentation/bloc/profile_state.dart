part of 'profile_bloc.dart';

sealed class ProfileState{
  const ProfileState();
  
  // @override
  // List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}



class ShowBottomModalSheetState extends ProfileState{
    final String newBio;

  ShowBottomModalSheetState({required this.newBio});
}

class ShowImagePickerOptionState extends ProfileState {}

