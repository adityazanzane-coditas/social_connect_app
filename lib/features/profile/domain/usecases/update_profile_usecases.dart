import 'package:social_connect_app/features/profile/domain/entity/entity.dart';
import 'package:social_connect_app/features/profile/domain/repositories/profile_reposotories.dart';

class UpdateProfileUsecases {
  final ProfileReposotories repository;

  UpdateProfileUsecases(this.repository);

  Future<void> call(String newBio) {
    return repository.updateProfileBio(newBio);
  }
  
}