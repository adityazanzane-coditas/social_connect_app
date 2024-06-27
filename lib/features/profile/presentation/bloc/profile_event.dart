part of 'profile_bloc.dart';

sealed class ProfileEvent  {
  const ProfileEvent();


}



class ShowBottomModalSheetEvent extends ProfileEvent{
  final String newBio;

  ShowBottomModalSheetEvent({required this.newBio});
  
}


class ShowImagePickerOptionEvent extends ProfileEvent{
  
}