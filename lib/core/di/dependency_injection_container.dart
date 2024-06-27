//di
import 'package:get_it/get_it.dart';
import 'package:social_connect_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:social_connect_app/features/authentication/data/repositories/auth_repository_implementation.dart';
import 'package:social_connect_app/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:social_connect_app/features/home/data/post_remote_data_source/post_remote_data_source.dart';
import 'package:social_connect_app/features/home/data/post_repository_impl/post_repository_impl.dart';
import 'package:social_connect_app/features/home/domain/usecase/post_usecase.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerSingleton(AuthDatasource());
  locator.registerSingleton(AuthRepositoryImplementation());
  locator.registerSingleton(AuthUsecases());
  locator.registerSingleton<PostRemoteDataSource>(PostRemoteDataSource());
  locator.registerSingleton<PostRepositoryImpl>(PostRepositoryImpl());
  locator.registerSingleton<PostUsecase>(PostUsecase(postRepository: locator<PostRepositoryImpl>()));
}






