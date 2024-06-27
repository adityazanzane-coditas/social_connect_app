import 'package:social_connect_app/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.bio,
      required super.uid,
      required super.imageUrl,
      required super.phoneNumber});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNumber: map['phoneNumber'] ?? '',
      bio: map['bio'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "phoneNumber": phoneNumber, 
      "bio" : bio, 
      "uid" : uid, 
      "imageUrl":imageUrl
    };
  }
}
