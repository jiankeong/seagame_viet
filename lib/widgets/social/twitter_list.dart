import 'package:flutter/material.dart';

import '../custom_shadow_container.dart';
import '../default_padding.dart';
import '../default_sized_box.dart';
import '../profile_avatar.dart';
import '../../styles.dart';
import '../no_records_found_text.dart';

class TwitterList extends StatelessWidget {
  final List<Map<String, dynamic>> _tweets = [
    {
      "name": "Lee Chong Wei",
      "username": "LeeChongWei",
      "profile_avatar": "https://pbs.twimg.com/media/D87WXuuW4AAgVlE.jpg",
      "content": "Wish myself a very best in the games :)",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return _tweets.isEmpty
        ? Center(
            child: NoRecordFoundText(),
          )
        : ListView.builder(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              Map<String, dynamic> tweet = _tweets[index];

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
                                profileImgUrl: tweet['profile_avatar'],
                                radius: 23.5,
                              ),
                              DefaultSizedBox.horizontal(15),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tweet['name'],
                                      style: TextStyle(
                                          fontSize: Styles.smallerTitleFontSize,
                                          fontWeight: Styles.boldText),
                                    ),
                                    DefaultSizedBox.vertical(3),
                                    Text(
                                      '@${tweet['username']}',
                                      style: TextStyle(
                                          fontSize: Styles.smallerRegularSize,
                                          color: Styles.suvaGrey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          DefaultSizedBox.vertical(15),
                          Text(
                            tweet['content'],
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
            itemCount: _tweets.length,
          );
  }
}
