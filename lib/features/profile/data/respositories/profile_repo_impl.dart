

import 'package:social_connect_app/features/profile/data/datasourec/firebase_datasource.dart';
import 'package:social_connect_app/features/profile/data/model/profile_model.dart';
import 'package:social_connect_app/features/profile/domain/repositories/profile_reposotories.dart';


class ProfileRepositoryImpl implements ProfileReposotories {
  final FirebaseDatasource datasource;

  ProfileRepositoryImpl(this.datasource,);

  @override
  Stream<ProfileModel> getProfile() {
    return datasource.getProfile();
  }
    @override
  Future<void>updateProfileBio(String newBio) {
    return datasource.updateProfileBio(newBio);
  }
   Future<void>updateImageUrl(String imageUrl) {
    return datasource.updateImageUrl(imageUrl);
  }
  // imageUrl
}
// class ProfileRepositoryImpl implements ProfileReposotories {
//   final FirebaseDatasource datasource;

//   ProfileRepositoryImpl(this.datasource);

//   @override
//   Stream<List<ProfileEntity>> getProfile() {
//     return datasource.getProfile().map((profiles) => profiles.cast<ProfileEntity>());
//   }

 
// }