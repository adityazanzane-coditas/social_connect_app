import 'dart:developer';

import 'package:social_connect_app/features/posts/data/models/post_model.dart';

import 'package:social_connect_app/features/posts/domain/repo_declaration/repo_declaration.dart';

class CreatePostUsecase {
  PostRepoDeclaration postRepoDeclaration;

  CreatePostUsecase({required this.postRepoDeclaration});

  Future<void> createPostUsecase(PostModel postModel) async {
    log("Inside usecase ");
    postRepoDeclaration.createPost(postModel);
  }
}
