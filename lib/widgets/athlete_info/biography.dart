import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:timelines/timelines.dart';

import '../custom_shadow_container.dart';
import '../default_padding.dart';
import '../../icon_image_path.dart';
import '../profile_avatar.dart';
import '../../styles.dart';
import '../country_flag_container.dart';
import '../info_vertical_layout.dart';
import '../../app_strings.dart';
import '../default_sized_box.dart';

class Biography extends StatelessWidget {
  final Map<String, dynamic> achievement = {
    "start_year": "2003",
    "end_year": "2004",
    "events": [
      {
        "name": "Malaysia Open",
        "title": "Runner Up",
      },
      {
        "name": "India Satelite",
        "title": "Runner Up",
      },
      {
        "name": "Malaysia Satelite",
        "title": "Champion",
      },
      {
        "name": "Malaysia Open",
        "title": "Champion",
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShadowContainer(
          topPadding: 15.h,
          bottomPadding: 15.h,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.h),
            bottomRight: Radius.circular(10.h),
          ),
          backgroundImage: AppImages.teamExploreBanner,
          child: DefaultPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      ProfileAvatar(
                        radius: 42,
                        profileImgUrl:
                            'https://pbs.twimg.com/media/D87WXuuW4AAgVlE.jpg',
                      ),
                      DefaultSizedBox.horizontal(15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LEE CHONG WEI',
                              style: TextStyle(
                                fontSize: 21.sp,
                                fontWeight: Styles.boldText,
                                color: Styles.whiteColor,
                              ),
                            ),
                            DefaultSizedBox.vertical(8),
                            Row(
                              children: [
                                CountryFlagContainer(
                                  countryFlag: AppImages.malaysia,
                                  width: 39.w,
                                  height: 23.h,
                                ),
                                DefaultSizedBox.horizontal(10),
                                Text('MAS',
                                    style: TextStyle(
                                      fontSize: Styles.titleFontSize,
                                      fontWeight: Styles.boldText,
                                      color: Styles.whiteColor,
                                    )),
                              ],
                            ),
                            DefaultSizedBox.vertical(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Badminton',
                                  style: TextStyle(
                                    fontSize: Styles.regularFontSize,
                                    color: Styles.whiteColor,
                                  ),
                                ),
                                DefaultSizedBox.horizontal(10),
                                Image.asset(
                                  AppImages.goldMedal,
                                  width: 24.h,
                                  height: 24.h,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InfoVerticalLayout(
                title: AppStrings.height.tr().toUpperCase(),
                value: '1.72 M',
              ),
              InfoVerticalLayout(
                title: AppStrings.weight.tr().toUpperCase(),
                value: '60 KG',
              ),
              InfoVerticalLayout(
                title: AppStrings.gender.tr().toUpperCase(),
                value: 'male'.toUpperCase(),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Styles.whiteColor,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
            ),
            child: DefaultPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.achievements.tr(),
                    style: TextStyle(
                        color: Styles.primaryColor,
                        fontSize: 21.sp,
                        fontWeight: Styles.boldText),
                  ),
                  DefaultSizedBox.vertical(10),
                  Expanded(
                    child: Timeline.tileBuilder(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      theme: TimelineThemeData(
                        nodePosition: 0.2,
                        color: Styles.suvaGrey,
                      ),
                      builder: TimelineTileBuilder.fromStyle(
                        contentsAlign: ContentsAlign.basic,
                        indicatorStyle: IndicatorStyle.dot,
                        oppositeContentsBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(right: 24.w, bottom: 65.h),
                              child: Text(
                                achievement['start_year'],
                                style: TextStyle(
                                  fontSize: Styles.smallerTitleFontSize,
                                  color: Styles.suvaGrey
                                ),
                              ),
                            );
                          }
                          if (index == achievement['events'].length - 1) {
                            return Padding(
                              padding: EdgeInsets.only(right: 24.w, top: 65.h),
                              child: Text(
                                achievement['end_year'],
                                style: TextStyle(
                                  fontSize: Styles.smallerTitleFontSize,
                                  color: Styles.suvaGrey
                                ),
                              ),
                            );
                          }
                        },
                        contentsBuilder: (context, index) {
                          Map<String, dynamic> event =
                              achievement['events'][index];
                          return Padding(
                            padding: EdgeInsets.all(24.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event['name'],
                                  style: TextStyle(
                                      color: Styles.primaryDarkColor,
                                      fontSize: Styles.smallerTitleFontSize,
                                      fontWeight: Styles.boldText),
                                ),
                                DefaultSizedBox.vertical(5),
                                Text(
                                  event['title'],
                                  style: TextStyle(
                                    color: Styles.primaryColor,
                                    fontSize: Styles.smallerTitleFontSize,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: achievement['events'].length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
