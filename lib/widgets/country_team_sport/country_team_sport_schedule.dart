import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_shadow_container.dart';
import '../default_cache_network_image.dart';
import '../default_sized_box.dart';
import '../../styles.dart';
import '../../utils/date_format_utils.dart';

class CountryTeamSportSchedule extends StatelessWidget {
  final List<Map<String, dynamic>> _scheduleList = [
    {
      "image":
          "https://static01.nyt.com/images/2020/04/12/sports/10nba-taiwan-top/10nba-taiwan-top-mobileMasterAt3x-v2.jpg",
      "title": "MEN’S BASKETBALL ROUND 1",
      "description": "INA VS MAS",
      "date": "2021-12-03 00:00:00",
      "start_time": "20:00",
      "end_time": "23:00",
      "type": "WheelChair Basketball",
      "location": "ISA SPORTS CITY",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Map<String, dynamic> update = _scheduleList[index];

        return Column(
          children: [
            InkWell(
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
                            update['type'].toString().toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: Styles.regularFontSize,
                                color: Styles.primaryColor,
                                fontWeight: Styles.boldText),
                          ),
                          DefaultSizedBox.vertical(5),
                          Text(
                            update['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: Styles.regularFontSize,
                                color: Styles.primaryDarkColor),
                          ),
                          DefaultSizedBox.vertical(5),
                          Text(
                            update['description'],
                            style: TextStyle(
                              fontSize: Styles.regularFontSize,
                              color: Styles.primaryDarkColor,
                              fontWeight: Styles.boldText,
                            ),
                          ),
                          DefaultSizedBox.vertical(20),
                          Container(
                            color: Styles.primaryDarkColor,
                            height: 3.h,
                            width: 16.w,
                          ),
                          DefaultSizedBox.vertical(5),
                          Text(
                            update['location'],
                            style: TextStyle(
                              fontSize: Styles.smallerRegularSize,
                              color: Styles.suvaGrey,
                            ),
                          ),
                          DefaultSizedBox.vertical(5),
                          Text(
                            '${DateFormatUtils.ddMMMEEE(
                              DateTime.parse(
                                update['date'],
                              ),
                            ).toUpperCase()} | ${update['start_time']} - ${update['end_time']}',
                            style: TextStyle(
                              color: Styles.suvaGrey,
                              fontSize: Styles.smallerRegularSize
                            ),
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
      itemCount: _scheduleList.length,
    );
  }
}
