// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_connect_app/features/home/domain/entity/post_entity.dart';

class PostCard extends StatelessWidget {
  final List<PostEntity> postEntity;
  final int index;

  const PostCard({super.key, required this.postEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Color(0xfff9f9f9),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                if (postEntity[index].profilePic.isNotEmpty &&
                    postEntity[index].profilePic != null)
                  ClipOval(
                    child: Image.network(
                      postEntity[index].profilePic,
                      width: 24,
                      height: 24,
                    ),
                  )
                else
                  Image.asset('assets/icons/navbar_profile.png'),
                const Expanded(
                  flex: 8,
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 220,
                  child: Text(
                    postEntity[index].phoneNumber.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff4D4D4D),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Expanded(
                  flex: 62,
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 40,
                  child: Text(
                    postEntity[index].postDate.dayMonthYear(),
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xffADADAD),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    postEntity[index].postText,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff757575),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (postEntity[index].postUrl != null &&
              postEntity[index].postUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Image.network(
                  postEntity[index].postUrl,
                  width: 334,
                  height: 223,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension on DateTime {
  String dayMonthYear() {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }
}
