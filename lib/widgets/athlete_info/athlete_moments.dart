import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_shadow_container.dart';
import '../default_cache_network_image.dart';
import '../default_sized_box.dart';
import '../../styles.dart';
import '../../screens/news_detail_screen.dart';
import '../../utils/date_format_utils.dart';

class AthleteMoments extends StatefulWidget {
  @override
  _AthleteMomentsState createState() => _AthleteMomentsState();
}

class _AthleteMomentsState extends State<AthleteMoments> {
  final List<Map<String, dynamic>> _moments = [
    {
      "image":
          "https://cms.bwfbadminton.com/wp-content/uploads/2018/04/finals_Lee-Chong-Wei.jpg",
      "title": "Lee smashing through the quaterfinals with straight wins",
      "date": "2021-05-21 00:00:00",
      "author": "Colin Ward-Henninger",
    },
    {
      "image":
          "https://apicms.thestar.com.my/uploads/images/2020/02/29/582079.jpg",
      "title": "Lee to face against old rivals. Will he prevail?",
      "date": "2021-05-21 00:00:00",
      "author": "Colin Ward-Henninger",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Map<String, dynamic> moment = _moments[index];

        return Column(
          children: [
            InkWell(
              onTap: () {
                moveToDetail(0);
              },
              child: CustomShadowContainer(
                roundedCorner: false,
                child: Row(
                  children: [
                    DefaultCacheNetworkImage(
                      imageUrl: moment['image'],
                      height: 148.h,
                      width: 148.h,
                    ),
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            moment['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Styles.smallerTitleFontSize,
                            ),
                          ),
                          DefaultSizedBox.vertical(10),
                          Text(
                            '${DateFormatUtils.ddMMMyyyFormat1(
                              DateTime.parse(moment['date']),
                            )} \u2022 ${moment['author']}',
                            style: TextStyle(
                                fontSize: Styles.smallerRegularSize,
                                color: Styles.suvaGrey),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            DefaultSizedBox.vertical(15),
          ],
        );
      },
      itemCount: _moments.length,
    );
  }

  void moveToDetail(int id) {
    Navigator.pushNamed(context, NewsDetailScreen.routeName, arguments: {
      "id": id,
    });
  }
}
