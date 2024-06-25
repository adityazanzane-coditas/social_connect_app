part of 'profile_bloc.dart';

sealed class ProfileEvent  {
  const ProfileEvent();

  // @override
  // List<Object> get props => [];
}



class ShowBottomModalSheetEvent extends ProfileEvent{
  final String newBio;

  ShowBottomModalSheetEvent({required this.newBio});
  
}


class ShowImagePickerOptionEvent extends ProfileEvent{
  
}