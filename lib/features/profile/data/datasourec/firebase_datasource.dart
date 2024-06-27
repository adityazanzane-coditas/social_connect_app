import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_connect_app/features/profile/data/model/profile_model.dart';

class FirebaseDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<ProfileModel> getProfile(String uid) {
 
      try {
         return _firestore
        .collection('registered_users')
        .doc('73x5M7xbusc6I3IlKx0CeANrhdc2')
        .snapshots()
        .map((snapshot) =>
            ProfileModel.fromMap(snapshot.data() as Map<String, dynamic>));
    } catch (e) {
      print('Error in getting profile bio: $e');
      throw e;
    }
  }

  Future<void> updateProfileBio(String newBio) async {
    try {
      DocumentReference profileRef = _firestore
          .collection('registered_users')
          .doc('73x5M7xbusc6I3IlKx0CeANrhdc2');
      print('intupdate*********');
      print(newBio);
      await profileRef.update({'bio': newBio});
    } catch (e) {
      print('Error updating bio: $e');
      throw e;
    }
  }

  Future<void> updateImageUrl(String imageUrl) async {
    try {
      DocumentReference profileRef = _firestore
          .collection('registered_users')
          .doc('73x5M7xbusc6I3IlKx0CeANrhdc2');
      print('In upadate image url*********');
      print(imageUrl);
      await profileRef.update({'imageUrl': imageUrl});
    } catch (e) {
      print('Error updating bio: $e');
      throw e;
    }
  }
}