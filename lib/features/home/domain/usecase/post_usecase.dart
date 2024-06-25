import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';
import 'package:social_connect_app/features/home/domain/repository/post_repository.dart';

class PostUsecase {
  final PostRepository postRepository;

  PostUsecase({required this.postRepository});

  Stream<List<PostEntity>> getPostsUsecase() {
    return postRepository.getPosts();
  }
}
