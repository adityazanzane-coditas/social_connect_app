import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/home/data/post_model/post_model.dart';
import 'package:social_connect_app/features/home/data/post_remote_data_source/post_remote_data_source.dart';
import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';
import 'package:social_connect_app/features/home/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  @override
  Stream<List<PostEntity>> getPosts() {
    Stream<List<PostModel>> postsList =
        locator<PostRemoteDataSource>().fetchPosts();
    return postsList;
  }
}
