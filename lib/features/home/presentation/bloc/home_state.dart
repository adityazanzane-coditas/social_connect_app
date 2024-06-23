import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';

sealed class HomeState{}

class PostDataLoadingState extends HomeState{}
class PostDataLoadedState extends HomeState{
  final List<PostEntity> postDataList;

  PostDataLoadedState({required this.postDataList});
}
class PostDataErrorState extends HomeState{
  final String error;

  PostDataErrorState({required this.error});
}