import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/home/data/post_model/post_model.dart';
import 'package:social_connect_app/features/home/data/post_remote_data_source/post_remote_data_source.dart';
import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';
import 'package:social_connect_app/features/home/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository
{
  @override
  Future<List<PostEntity>> getPosts() async{
    // TODO: implement getPosts
    //throw UnimplementedError();
   final List<PostModel> posts = await locator<PostRemoteDataSource>().fetchPosts();
   return posts;
  }
  
}