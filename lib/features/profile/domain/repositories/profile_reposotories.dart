import 'package:social_connect_app/features/profile/data/model/profile_model.dart';
import 'package:social_connect_app/features/profile/domain/entity/entity.dart';

abstract class ProfileReposotories {
  Stream<ProfileModel> getProfile();
  Future<void> updateProfileBio(String newBio);
  Future<void> updateImageUrl(String imageUrl);
}
