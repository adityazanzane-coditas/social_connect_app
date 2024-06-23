import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_connect_app/features/home/data/post_model/post_model.dart';

class PostRemoteDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<PostModel>> fetchPosts() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('post').get();
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;
      return docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return PostModel.fromJson(data);
      }).toList();
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }
}
