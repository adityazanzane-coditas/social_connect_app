import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:social_connect_app/features/authentication/data/models/user_model.dart';

import 'package:social_connect_app/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  @override
  Future<void> authenticateUser(
      String phoneNumber, BuildContext context) async {
    return await locator<AuthDatasource>()
        .phoneVerification(phoneNumber, context);
  }

  @override
  FirebaseAuth getFirebaseInstance() {
    return locator<AuthDatasource>().getFirebaseInstance();
  }

  @override
  Future<bool> checkIfUserExists(User user) async {
    return await locator<AuthDatasource>().checkExistingUser(user);
  }

  @override
  Future<bool> saveNewUserToFirebase(
      BuildContext context, UserModel user, File? profilePic, String uid) async {
    return await locator<AuthDatasource>()
        .saveNewUserToFirebase(context, user, profilePic, uid);
  }
}
