import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:social_connect_app/core/routes/app_router.gr.dart';
import 'package:social_connect_app/features/authentication/data/models/user_model.dart';

class AuthDatasource {
  Future<void> phoneVerification(
      String phoneNumber, BuildContext context) async {
    FirebaseAuth auth = getFirebaseInstance();
    await auth.setSettings(
        appVerificationDisabledForTesting: true, forceRecaptchaFlow: false);
    await auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException exception) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(exception.message!),
            ),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          context.pushRoute(
            OtpRoute(phoneNumber: phoneNumber, verificationId: verificationId),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneNumber);
  }

  Future<bool> checkExistingUser(User user) async {
    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

    DocumentSnapshot snapShot = await firestoreInstance
        .collection("registered_users")
        .doc(user.uid)
        .get();

    if (snapShot.exists) {
      log("User Exists");
      return true;
    }
    log("New User");
    return false;
  }

  FirebaseAuth getFirebaseInstance() {
    return FirebaseAuth.instance;
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<bool> saveNewUserToFirebase(
    BuildContext context,
    UserModel user,
    File? profilePic,
    String uid,
  ) async {
    bool? success;
    try {
      if (profilePic != null) {
        await storeFileToStorage("profilePic/$uid", profilePic).then((value) {
          user.imageUrl = value;
        });
      } else {
        user.imageUrl =
            'https://firebasestorage.googleapis.com/v0/b/social-connect-app-dd349.appspot.com/o/profilePic%2FQ7CdWWjH6tdp6hodUgBGpbyRcWb2?alt=media&token=17ec95f6-b485-4fe5-8778-fd6a525ad428';
      }
      await FirebaseFirestore.instance
          .collection("registered_users")
          .doc(user.uid)
          .set(user.toMap())
          .then((onValue) {
        success = true;
      });
      return success ?? false;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
        ),
      );
      return false;
    }
  }
}
