import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_connect_app/features/home/data/post_model/post_model.dart';

class PostRemoteDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<PostModel>> fetchPosts() {
    return firestore.collection('posts').snapshots().map((event) {
      return event.docs.map((event) {
        return PostModel.fromJson(event.data());
      }).toList();
    }).handleError((error) {
      print('Error fetching posts: $error');
      return [];
    });
  }
}
