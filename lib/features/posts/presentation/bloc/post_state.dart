part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class CreatePostState extends PostState {}

class LoadingCreatePostState extends PostState {}
