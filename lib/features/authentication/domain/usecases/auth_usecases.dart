import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/authentication/data/models/user_model.dart';

import 'package:social_connect_app/features/authentication/data/repositories/auth_repository_implementation.dart';

class AuthUsecases {
  Future<void> authenticateUser(
      String phoneNumber, BuildContext context) async {
    return await locator<AuthRepositoryImplementation>()
        .authenticateUser(phoneNumber, context);
  }

  FirebaseAuth getFirebaseInstance() {
    return locator<AuthRepositoryImplementation>().getFirebaseInstance();
  }

  Future<bool> checkIfUserExists(User user) async {
    return await locator<AuthRepositoryImplementation>()
        .checkIfUserExists(user);
  }

  Future<bool> saveNewUserToFirebase(BuildContext context, UserModel user,
      File? profilePic, String uid) async {
    return await locator<AuthRepositoryImplementation>()
        .saveNewUserToFirebase(context, user, profilePic, uid);
  }
}
