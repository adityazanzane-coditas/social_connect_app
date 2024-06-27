import 'package:social_connect_app/features/posts/data/models/post_model.dart';

abstract class PostRepoDeclaration {
  void createPost(PostModel postModel) {}
}
