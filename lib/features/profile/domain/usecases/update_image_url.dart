import 'package:social_connect_app/features/profile/domain/repositories/profile_reposotories.dart';

class UpdateImageUrl {
  final ProfileReposotories repository;

  UpdateImageUrl(this.repository);

  Future<void> call(String imageUrl) {
    return repository.updateImageUrl(imageUrl);
  }
  

}