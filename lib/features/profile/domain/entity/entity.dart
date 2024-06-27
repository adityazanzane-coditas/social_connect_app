import 'package:equatable/equatable.dart';

class ProfileEntity  {
  // final String userId;
  final String bio;
  final String phoneNumber;
  final String profilePicture;
  final String userName;

  const ProfileEntity({
    // required this.userId,
    required this.bio,
    required this.phoneNumber,
    required this.profilePicture,
    required this.userName,
  });

  // @override
  // List<Object?> get props => [ bio, phoneNumber, profilePicture, userName];
}
