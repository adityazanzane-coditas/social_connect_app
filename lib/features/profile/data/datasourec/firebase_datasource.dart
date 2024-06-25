import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_connect_app/features/profile/data/model/profile_model.dart';

class FirebaseDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<ProfileModel> getProfile() {
    return _firestore
        .collection('user_info')
        .doc('CwEC5KOeqTm768l1AFXz')
        .snapshots()
        .map((snapshot) =>
            ProfileModel.fromMap(snapshot.data() as Map<String, dynamic>));
  }

  //  Future<void> updateProfile(String newBio) {

  //  return  _firestore.collection('user_info')
  //     .doc('ezPLnoXP2k1Niv9bkncv')
  //     .update({'bio': newBio});
  // }

  Future<void> updateProfileBio(String newBio) async {
    try {
      DocumentReference profileRef = _firestore.collection('user_info').doc(
          'CwEC5KOeqTm768l1AFXz'); 
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
      DocumentReference profileRef = _firestore.collection('user_info').doc(
          'CwEC5KOeqTm768l1AFXz'); 
          print('In upadate image url*********');
      print(imageUrl);
      await profileRef.update({'profile_picture': imageUrl});
    } catch (e) {
      print('Error updating bio: $e');
      throw e;
    }
  }

// class FirebaseDatasource {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<List<ProfileModel>> getProfile() {
//     return _firestore.collection('user_info').snapshots().map(
//           (snapshot) => snapshot.docs
//               .map((doc) => ProfileModel.fromMap(doc.data()))
//               .toList(),
//         );
//   }

// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:social_connect_app/features/settings/data/model/profile_model.dart';

// class FirebaseDatasource {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<List<ProfileModel>> getProfile() {
//     return _firestore.collection('user_info').snapshots().map(
//           (snapshot) => snapshot.docs
//               .map((doc) => ProfileModel.fromMap(doc.data() as Map<String, dynamic>))
//               .toList(),
//         );
//   }
// }

  // void updateBio(String userId, String newBio) {
  //   _firestore.collection('user_info')
  //     .doc(userId)
  //     .update({'bio': newBio});
  // }
  // void updateProfile(ProfileModel newData){

  //   _firestore.collection('user_info')
  //   .doc('8tqPHmDhUpPNWei6QPWw')
  //   .update(newData as Map<String, dynamic>);
  // }
}
