import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/authentication/data/datasources/auth_datasource.dart';


import 'package:social_connect_app/features/posts/data/models/post_model.dart';
import 'package:social_connect_app/features/posts/domain/usecase/post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
    on<CreatePostEvent>(createPostEvent);
    on<LoadingCreatePostEvent>(loadingCreateClassEvent);
    on<PostInitialEvent>(postInitialEvent);
  }

  FutureOr<void> createPostEvent(
      CreatePostEvent event, Emitter<PostState> emit) async {
    log("Creating postmodel");

   
    log("Profile url : $currentUserImageURL");
    PostModel postModel = PostModel(
        post_date: DateTime.now(),
        post_text: event.postText,
        post_url: event.postURL,
        profile_pic: currentUserImageURL ?? "",
        phone_no: currentUserPhoneNo.toString());

    log("Calling create post firebase service");

    await locator<CreatePostUsecase>().createPostUsecase(postModel);

    emit(CreatePostState());
  }

  FutureOr<void> loadingCreateClassEvent(
      LoadingCreatePostEvent event, Emitter<PostState> emit) async {
    emit(LoadingCreatePostState());
  }

  FutureOr<void> postInitialEvent(
      PostInitialEvent event, Emitter<PostState> emit) {
    emit(PostInitial());
  }
}
