import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';

abstract class PostRepository 
{
  Future<List<PostEntity>> getPosts();
}