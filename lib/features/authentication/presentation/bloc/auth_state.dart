part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class NavigateToOtpVerficationState extends AuthState {
  final String phoneNumber;

  NavigateToOtpVerficationState({required this.phoneNumber});
}

final class SuccessAuthenticatingUser extends AuthState {
  final User user;

  final bool navigateToHome;

  SuccessAuthenticatingUser({required this.navigateToHome, required this.user});
}

final class LoadingState extends AuthState {}

final class ErrorAuthenticatingUser extends AuthState {}

final class SuccessSavingNewUserState extends AuthState {}

final class ErrorSavingNewUserState extends AuthState {}

final class LoadingAuthState extends AuthState {}
