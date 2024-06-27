import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:social_connect_app/core/di/dependency_injection_container.dart';

import 'package:social_connect_app/features/posts/data/data_source/data_source.dart';
import 'package:social_connect_app/features/posts/data/models/post_model.dart';
import 'package:social_connect_app/features/posts/domain/repo_declaration/repo_declaration.dart';

class PostRepoImplementation implements PostRepoDeclaration {
  @override
  Future<void> createPost(PostModel postModel) async {
    log("Inside post implementation");

    await locator<PostsDataSource>().createPost(postModel);
  }
}
