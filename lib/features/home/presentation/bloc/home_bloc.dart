import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';
import 'package:social_connect_app/features/home/domain/usecase/post_usecase.dart';
import 'package:social_connect_app/features/home/presentation/bloc/home_event.dart';
import 'package:social_connect_app/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc <HomeEvent,HomeState>
{
  HomeBloc():super(PostDataLoadingState())
  {
    on<InitialHomeEvent>(initialHomeEvent);
  }

  FutureOr<void> initialHomeEvent(InitialHomeEvent event, Emitter emit) async {
    emit(PostDataLoadingState());
    try{
      final postData = await locator<PostUsecase>().getPostsUsecase();
      print('data fetched');
      emit(PostDataLoadedState(postDataList: postData));
      print('data loaded');
    }
    catch(e)
    {
      print('error occurs $e');
      emit(PostDataErrorState(error: 'error $e occurs'));
    }
  }
}