import 'package:flutter/material.dart';

import '../custom_shadow_container.dart';
import '../default_padding.dart';
import '../default_sized_box.dart';
import '../profile_avatar.dart';
import '../../styles.dart';
import '../no_records_found_text.dart';

class FacebookList extends StatelessWidget {
  final List<Map<String, dynamic>> _posts = [
    {
      "name": "Lee Chong Wei",
      "profile_avatar": "https://360badminton.com/wp-content/uploads/2020/03/When-Lee-Chong-Wei-went-to-buy-2-weeks-grocery-.jpg",
      "content": "Having lunch with my lovely family !!!",
    },
    {
      "name": "Lee Chong Wei",
      "profile_avatar": "https://360badminton.com/wp-content/uploads/2020/03/When-Lee-Chong-Wei-went-to-buy-2-weeks-grocery-.jpg",
      "content": "What a match between those players, thumbs up",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return _posts.isEmpty
        ? Center(
            child: NoRecordFoundText(),
          )
        : ListView.builder(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              Map<String, dynamic> post = _posts[index];

              return Column(
                children: [
                  CustomShadowContainer(
                    topPadding: 15,
                    bottomPadding: 15,
                    roundedCorner: false,
                    child: DefaultPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ProfileAvatar(
                                profileImgUrl: post['profile_avatar'],
                                radius: 23.5,
                              ),
                              DefaultSizedBox.horizontal(15),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post['name'],
                                      style: TextStyle(
                                          fontSize: Styles.smallerTitleFontSize,
                                          fontWeight: Styles.boldText),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          DefaultSizedBox.vertical(15),
                          Text(
                            post['content'],
                            style: TextStyle(
                              fontSize: Styles.regularFontSize,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  DefaultSizedBox.vertical(15),
                ],
              );
            },
            itemCount: _posts.length,
          );
  }
}
