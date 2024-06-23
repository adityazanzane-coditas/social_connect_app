import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/constants/font_contants.dart';
import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:social_connect_app/features/home/presentation/bloc/home_event.dart';
import 'package:social_connect_app/features/home/presentation/bloc/home_state.dart';
import 'package:social_connect_app/features/home/presentation/widgets/post_card.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: Text('awk-wardly',style: fontAlata(fontSize: 33, fontWeight: FontWeight.normal, fontColor: ColorPallete.orangeColor)),),
        body: 
        RefreshIndicator(
          color: Colors.grey,
          backgroundColor: Colors.white,
         onRefresh: () async{
             BlocProvider.of<HomeBloc>(context).add(InitialHomeEvent());
         },
         
       
          child: BlocConsumer<HomeBloc,HomeState>(
            buildWhen: (previous, current) => current is HomeState,
            builder:
          (context, state) {
            switch(state.runtimeType)
            {
              case PostDataLoadingState:
              return const Center(child: const CircularProgressIndicator());
          
              case PostDataLoadedState:
              final postDataState = state as PostDataLoadedState;
              return Padding(
                padding: const EdgeInsets.all(14),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.postDataList.length,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostCard(postEntity: state.postDataList, index: index),
                      const SizedBox(height: 15)
                    ],
                  );
                },),
              );
          
          
          case PostDataErrorState:
          final errorState = state as PostDataErrorState;
          return Center(child: Text(state.error));
          
          
          default : return const Center(child: Text('Page not found'));
            }
          }
          
          , listener: 
          (context, state) {
          
          },
          
          ),
        )
       
    );
  }
}