import 'package:social_connect_app/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  DateTime post_date;
  String post_text;
  String post_url;
  String profile_pic;
  String phone_no;

  PostModel({
    required this.post_date,
    required this.post_text,
    required this.post_url,
    required this.profile_pic,
    required this.phone_no,
  }) : super(
            post_date: post_date,
            post_text: post_text,
            post_url: post_url,
            profile_pic: profile_pic,
            phone_no: phone_no);

  Map<String, dynamic> toMap() {
    return {
      'post_date': post_date,
      'post_text': post_text,
      'post_url': post_url,
      'profile_pic': profile_pic,
      'phone_no': phone_no,
    };
  }
}
