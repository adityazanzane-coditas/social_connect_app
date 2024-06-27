import 'package:social_connect_app/features/profile/domain/entity/entity.dart';



class ProfileModel extends ProfileEntity {
  const ProfileModel({
        required super.uid,
    required super.bio,
    required super.phoneNumber,
    required super.profilePicture,
    required super.userName,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> data) {
    return ProfileModel(
      uid: data['uid']?.toString() ?? '',
      bio: data['bio']?.toString() ?? '',
      phoneNumber: data['phoneNumber']?.toString() ?? '',
      profilePicture: data['imageUrl']?.toString() ?? '',
      userName: data['username']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'bio': bio,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'userName': userName,
    };
  }

  ProfileModel copyWith({
    String? uid,
    String? userName,
    String? profilePicture,
    String? phoneNumber,
    String? bio,
  }) {
    return ProfileModel(
      uid: uid?? this.uid,
      userName: userName ?? this.userName,
      profilePicture: profilePicture ?? this.profilePicture,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
    );
  }
}