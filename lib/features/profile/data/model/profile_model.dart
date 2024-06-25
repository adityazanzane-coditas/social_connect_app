import 'package:social_connect_app/features/profile/domain/entity/entity.dart';



// class ProfileModel extends ProfileEntity {
//   const ProfileModel({
//     // required super.userId,
//     required super.bio,
//     required super.phoneNumber,
//     required super.profilePicture,
//     required super.userName,
//   });
//   factory ProfileModel.fromMap(Map<String, dynamic> data) {
//     return ProfileModel(
//       // userId: data['userId'],
//       bio: data['bio']?.toString() ?? '',
//       phoneNumber: data['phone_number']?.toString() ?? '',
//       profilePicture: data['profile_picture']?.toString() ?? '',
//       userName: data['username']?.toString() ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       // 'userId': userId,
//       'bio': bio,
//       'phoneNumber': phoneNumber,
//       'profilePicture': profilePicture,
//       'userName': userName,
//     };
//   }
//    ProfileModel copyWith({
//     // String? userId,
//     String? userName,
//     String? profilePicture,
//     String? phoneNumber,
//     String? bio,
//   }) {
//     return ProfileModel(
//       // userId: userId ?? this.userId,
//       userName: userName ?? this.userName,
//       profilePicture: profilePicture ?? this.profilePicture,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       bio: bio ?? this.bio,
//     );
//   }
// }
class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.bio,
    required super.phoneNumber,
    required super.profilePicture,
    required super.userName,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> data) {
    return ProfileModel(
      bio: data['bio']?.toString() ?? '',
      phoneNumber: data['phone_number']?.toString() ?? '',
      profilePicture: data['profile_picture']?.toString() ?? '',
      userName: data['username']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'userName': userName,
    };
  }

  ProfileModel copyWith({
    String? userName,
    String? profilePicture,
    String? phoneNumber,
    String? bio,
  }) {
    return ProfileModel(
      userName: userName ?? this.userName,
      profilePicture: profilePicture ?? this.profilePicture,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
    );
  }
}