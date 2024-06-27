import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/authentication/data/models/user_model.dart';
import 'package:social_connect_app/features/posts/data/models/post_model.dart';

class PostsDataSource {
  CollectionReference postReference =
      FirebaseFirestore.instance.collection('posts');

  Future<void> createPost(PostModel postModel) async {
    try {
      await postReference
          .add(postModel.toMap())
          .timeout(const Duration(seconds: 10));
      print("Post created over firebase");
    } on TimeoutException catch (e) {
      print("Request to Firebase timed out: $e");
      throw Exception("Request to Firebase timed out");
    } on SocketException catch (e) {
      print("Network error while trying to create post: $e");
      throw Exception("Network Error !");
    } catch (e) {
      print("Error in creating post: $e");
      throw Exception(e);
    }
  }


  Future<UserModel> getUserDetails(String uid) async {

    CollectionReference userReference =
        FirebaseFirestore.instance.collection('registered_users');

    try {
      
      DocumentSnapshot documentSnapshot = await userReference.doc(uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;
        return UserModel.fromMap(userData);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print("Error in fetching user details: $e");
      throw Exception(e);
    }
  }
}
