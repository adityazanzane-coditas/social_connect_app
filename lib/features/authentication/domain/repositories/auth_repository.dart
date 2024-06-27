import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/features/authentication/data/models/user_model.dart';

abstract interface class AuthRepository {
  Future<void> authenticateUser(String phoneNumber, BuildContext context);
  FirebaseAuth getFirebaseInstance();

  Future<bool> checkIfUserExists(User user);

  Future<bool> saveNewUserToFirebase(
    BuildContext context,
    UserModel user,
    File? profilePic,
    String uid,
  );
}
