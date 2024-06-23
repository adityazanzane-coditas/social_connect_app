import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  final String userName;
  final String profilePic;
  final String postUrl;
  final String postText;
  final DateTime postDate;

  //static const String defaultProfilePic = 'assets/icons/navbar_profile.png';

  PostModel({
    required this.userName,
    required this.profilePic,
    required this.postUrl,
    required this.postText,
    required this.postDate,
  }) : super(
          postDate: postDate,
          postText: postText,
          postUrl: postUrl,
          profilePic: profilePic,
          userName: userName,
        );

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      userName: map['user_name'] ?? '',
      profilePic: map['profile_pic']?.isEmpty ?? true  ? ''  : map['profile_pic'],
        
         
      postUrl: map['post_url']?.isEmpty ?? true ? '' : map['post_url'],
      postText: map['post_text'] ?? '',
     postDate: (map['post_date'] as Timestamp).toDate(),
    );
  }
}