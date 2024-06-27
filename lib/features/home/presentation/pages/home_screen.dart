import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:social_connect_app/core/constants/font_contants.dart';
import 'package:social_connect_app/core/di/dependency_injection_container.dart';

import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';
import 'package:social_connect_app/features/home/domain/usecase/post_usecase.dart';

import 'package:social_connect_app/features/home/presentation/widgets/post_card.dart';
import 'package:social_connect_app/features/posts/presentation/pages/custom_wrapper.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostEntity>? previousData;
  final ScrollController scrollController = ScrollController();

  void _scrollUp() {
    scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: const Duration(seconds: 2), curve: Curves.bounceOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'awk-wardly',
          style: fontAlata(
            fontSize: 33,
            fontWeight: FontWeight.normal,
            fontColor: ColorPallete.orangeColor,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: locator<PostUsecase>().getPostsUsecase(),
        builder: (context, AsyncSnapshot<List<PostEntity>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<PostEntity> postDataList = snapshot.data!;

            /// sorting the data in list date wise in descending order
            postDataList.sort((a, b) => b.postDate.compareTo(a.postDate));

            bool isNewData = false;
            if (previousData == null) {
              previousData = List.from(postDataList);
            } else {
              isNewData = postDataList.length > previousData!.length;
            }

            if (isNewData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: const Text('New data added'),
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'View Post',
                        onPressed: () {
                          _scrollUp();
                        },
                      )),
                );
              });
              previousData = List.from(postDataList);
            }

            return Visibility(
              visible: !(postDataList.isNotEmpty),
              replacement: Padding(
                padding: const EdgeInsets.all(14),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: postDataList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PostCard(postEntity: postDataList, index: index),
                        const SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              ),
              child: Center(
                child: Text(
                  'No posts yet....',
                  style: GoogleFonts.alata(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 177, 174, 174),
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCustomModal(context);
        },
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/icons/navbar_posts.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
