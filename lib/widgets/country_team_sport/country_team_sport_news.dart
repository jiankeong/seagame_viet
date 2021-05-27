import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_shadow_container.dart';
import '../default_cache_network_image.dart';
import '../../styles.dart';
import '../default_sized_box.dart';
import '../../screens/news_detail_screen.dart';
import '../../utils/date_format_utils.dart';

class CountryTeamSportNews extends StatefulWidget {
  @override
  _CountryTeamSportNewsState createState() => _CountryTeamSportNewsState();
}

class _CountryTeamSportNewsState extends State<CountryTeamSportNews> {
  final List<Map<String, dynamic>> _newsList = [
    {
      "image":
          "https://img.jakpost.net/c/2020/02/24/2020_02_24_87252_1582536589._large.jpg",
      "title": "Malaysian Ends the Prelims with a Dunk.",
      "date": "2021-05-21 00:00:00",
      "author": "Colin Ward-Henninger",
    },
    {
      "image":
          "https://images.theconversation.com/files/400718/original/file-20210514-17-1huj66d.jpg?ixlib=rb-1.1.0&rect=6%2C125%2C4625%2C2312&q=45&auto=format&w=668&h=324&fit=crop",
      "title": "A Team Effort to break past obstacles",
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
        Map<String, dynamic> update = _newsList[index];

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
                      imageUrl: update['image'],
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
                            update['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Styles.smallerTitleFontSize,
                            ),
                          ),
                          DefaultSizedBox.vertical(10),
                          Text(
                            '${DateFormatUtils.ddMMMyyyFormat1(
                              DateTime.parse(update['date']),
                            )} \u2022 ${update['author']}',
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
      itemCount: _newsList.length,
    );
  }

  void moveToDetail(int id) {
    Navigator.pushNamed(context, NewsDetailScreen.routeName, arguments: {
      "id": id,
    });
  }
}
