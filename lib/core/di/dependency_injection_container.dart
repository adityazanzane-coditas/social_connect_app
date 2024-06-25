//di

import 'package:get_it/get_it.dart';
import 'package:social_connect_app/features/profile/data/datasourec/firebase_datasource.dart';
import 'package:social_connect_app/features/profile/data/respositories/profile_repo_impl.dart';
import 'package:social_connect_app/features/profile/domain/repositories/profile_reposotories.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<FirebaseDatasource>(() => FirebaseDatasource());

  getIt.registerLazySingleton<ProfileReposotories>(
      () => ProfileRepositoryImpl(getIt<FirebaseDatasource>()));
}

// final GetIt getIt = GetIt.instance;

// void setup() {
//   getIt.registerLazySingleton<FirebaseDatasource>(() => FirebaseDatasource());

//   getIt.registerLazySingleton<ProfileReposotories>(
//       () => ProfileRepositoryImpl(getIt<FirebaseDatasource>()));
// }
