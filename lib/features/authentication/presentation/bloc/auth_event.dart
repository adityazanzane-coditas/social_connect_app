part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class OnGetOtpButtonClickedEvent extends AuthEvent {
  final String phoneNumber;
  final BuildContext context;

  OnGetOtpButtonClickedEvent(
      {required this.context, required this.phoneNumber});
}

final class OnVerifyOtpButtonClickedEvent extends AuthEvent {
  final String otp, verificationId;
  final BuildContext context;

  OnVerifyOtpButtonClickedEvent(
      {required this.verificationId, required this.otp, required this.context});
}

final class OnSaveNewUserProfileButtonClickedEvent extends AuthEvent {
  final UserModel user;
  final BuildContext context;
  final File? pickedImage;

  OnSaveNewUserProfileButtonClickedEvent(
      {required this.pickedImage, required this.context, required this.user});
}
