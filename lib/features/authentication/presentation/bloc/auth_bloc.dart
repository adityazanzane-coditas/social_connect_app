import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/authentication/data/models/user_model.dart';
import 'package:social_connect_app/features/authentication/domain/usecases/auth_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<OnGetOtpButtonClickedEvent>(onGetOtpButtonClickedEvent);
    on<OnVerifyOtpButtonClickedEvent>(onVerifyOtpButtonClickedEvent);
    on<OnSaveNewUserProfileButtonClickedEvent>(
        onSaveNewUserProfileButtonClickedEvent);
  }

  FutureOr<void> onGetOtpButtonClickedEvent(
      OnGetOtpButtonClickedEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      await locator<AuthUsecases>()
          .authenticateUser(event.phoneNumber, event.context);
      emit(NavigateToOtpVerficationState(phoneNumber: event.phoneNumber));
    } on Exception catch (ex) {
      print(ex);
      emit(ErrorAuthenticatingUser());
    }
  }

  FutureOr<void> onVerifyOtpButtonClickedEvent(
      OnVerifyOtpButtonClickedEvent event, Emitter<AuthState> emit) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otp,
      );

      emit(LoadingAuthState());

      await locator<AuthUsecases>()
          .getFirebaseInstance()
          .signInWithCredential(credential)
          .then((value) async {
        User? user = value.user;
        if (user != null) {
          print("Emitting success state");

          bool userExists =
              await locator<AuthUsecases>().checkIfUserExists(user);

          if (userExists) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setBool('isLoggedIn', true);
            emit(SuccessAuthenticatingUser(user: user, navigateToHome: true));
          } else {
            emit(SuccessAuthenticatingUser(navigateToHome: false, user: user));
          }
        } else {
          print("Emitting error state");
          emit(ErrorAuthenticatingUser());
        }
      });
    } on FirebaseAuthException catch (ex) {
      emit(ErrorAuthenticatingUser());
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text(
            ex.message.toString(),
          ),
        ),
      );
    }
  }

  FutureOr<void> onSaveNewUserProfileButtonClickedEvent(
      OnSaveNewUserProfileButtonClickedEvent event,
      Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    if (await locator<AuthUsecases>().saveNewUserToFirebase(
        event.context, event.user, event.pickedImage, event.user.uid)) {
      log("Success Saving new User");
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('isLoggedIn', true);
      emit(SuccessSavingNewUserState());
    } else {
      log("Error Saving new User");
      emit(ErrorSavingNewUserState());
    }
  }
}
