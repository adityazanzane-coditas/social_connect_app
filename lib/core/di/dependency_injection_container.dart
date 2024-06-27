//di

import 'package:get_it/get_it.dart';
import 'package:social_connect_app/features/home/data/post_remote_data_source/post_remote_data_source.dart';
import 'package:social_connect_app/features/home/data/post_repository_impl/post_repository_impl.dart';
import 'package:social_connect_app/features/home/domain/usecase/post_usecase.dart';
import 'package:social_connect_app/features/posts/data/data_source/data_source.dart';
import 'package:social_connect_app/features/posts/data/repo_implementation/repo_implementation.dart';
import 'package:social_connect_app/features/posts/domain/usecase/post_usecase.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerSingleton<PostRemoteDataSource>(PostRemoteDataSource());
  locator.registerSingleton<PostRepositoryImpl>(PostRepositoryImpl());
  locator.registerSingleton<PostUsecase>(
      PostUsecase(postRepository: locator<PostRepositoryImpl>()));
  locator.registerSingleton<PostsDataSource>(PostsDataSource());
  locator.registerSingleton<PostRepoImplementation>(PostRepoImplementation());
  locator.registerSingleton<CreatePostUsecase>(CreatePostUsecase(
      postRepoDeclaration: locator<PostRepoImplementation>()));
}
