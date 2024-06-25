

import 'package:social_connect_app/features/profile/domain/entity/entity.dart';
import 'package:social_connect_app/features/profile/domain/repositories/profile_reposotories.dart';

class GetProfileUseCase {
  final ProfileReposotories repository;

  GetProfileUseCase(this.repository);

  Stream<ProfileEntity> call() {
    return repository.getProfile();
  }
  

}