part of 'post_bloc.dart';

sealed class PostEvent {}

class CreatePostEvent extends PostEvent {
  BuildContext context;
  String postText;
  String postURL;

  CreatePostEvent({required this.context, required this.postText, required this.postURL});
}

class LoadingCreatePostEvent extends PostEvent{

}


