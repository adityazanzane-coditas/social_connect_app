
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_connect_app/features/posts/data/models/post_model.dart';

class DatabaseService {
  late CollectionReference postReference;
  

  DatabaseService() {
   postReference = FirebaseFirestore.instance.collection('posts');
  }

  Future<void> createPost(PostModel postModel) async {
    try {
      await postReference.add(postModel.toMap());
      log("Post created over Firebase");
    } catch (e) {
     log("Error in postRegistration");
    }
  }

}