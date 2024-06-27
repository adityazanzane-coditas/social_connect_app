//di
import 'package:get_it/get_it.dart';
import 'package:social_connect_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:social_connect_app/features/authentication/data/repositories/auth_repository_implementation.dart';
import 'package:social_connect_app/features/authentication/domain/usecases/auth_usecases.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerSingleton(AuthDatasource());
  locator.registerSingleton(AuthRepositoryImplementation());
  locator.registerSingleton(AuthUsecases());
}
