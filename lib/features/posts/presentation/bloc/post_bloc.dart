import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:social_connect_app/core/firebase/database_services.dart';
import 'package:social_connect_app/features/posts/data/models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
    on<CreatePostEvent>(createPostEvent);
    on<LoadingCreatePostEvent>(loadingCreateClassEvent);


  }



  FutureOr<void> createPostEvent(
      CreatePostEvent event, Emitter<PostState> emit) async {

    

    log("Creating postmodel");

    PostModel postModel = PostModel(
        post_date: DateTime.now(),
        post_text: event.postText,
        post_url: event.postURL,
        profile_pic: "",
        phone_no: '9876543210');

    log("Calling create post firebase service");

    await DatabaseService().createPost(postModel);

    emit(CreatePostState());
  }

  FutureOr<void> loadingCreateClassEvent(LoadingCreatePostEvent event, Emitter<PostState> emit) async{
    emit(LoadingCreatePostState());
  }
}
