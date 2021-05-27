import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../globals.dart';
import '../default_cache_network_image.dart';
import '../custom_shadow_container.dart';
import '../../styles.dart';
import '../../app_strings.dart';
import '../../constants/app_constants.dart';
import '../default_padding.dart';
import '../default_sized_box.dart';
import '../search_container.dart';

class ExploreScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _sights = [
    {
      "image":
          "https://dimg06.c-ctrip.com/images/35070v000000k483k3C14_C_500_280_Q80.jpg",
      "name": "Central Post Office",
      "description":
          "The Central Post Office in Ho Chi Minh is a beautifully preserved remnant of French colonial times and perhaps the grandest post office in all of Southeast Asia.",
      "rating": Random().nextDouble() * (5 - 3.5) + 3.5,
      "rating_count": Random().nextInt(9999),
    },
    {
      "image": "https://m.justgola.com/media/a/00/15/88030_og_1.jpeg",
      "name": " Linh Ung Pagoda",
      "description": "To sense to Buddhist culture in Vietnam",
      "rating": Random().nextDouble() * (5 - 3.5) + 3.5,
      "rating_count": Random().nextInt(9999),
    },
    {
      "image":
          "https://cdn.vnexplorer.net/img/2021/3/26/e88e55de2f33c8a7bc5057b2d6236ecb.jpg?v=1.0",
      "name": "Golden Bridge",
      "description":
          "he Golden Bridge is among the most favoured destinations by visitors in Danang",
      "rating": Random().nextDouble() * (5 - 3.5) + 3.5,
      "rating_count": Random().nextInt(9999),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              DefaultCacheNetworkImage(
                imageUrl:
                    'https://howdoigo.asia/wp-content/uploads/2017/12/hanoi-to-ho-chi-minh.jpg',
                width: double.infinity,
                height: Globals().getScreenHeight() * 0.38,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
                child: SearchContainer(
                  hintText: "Hanoi",
                ),
              ),
              Positioned(
                bottom: 0.0,
                width: Globals().getScreenWidth() * 0.85,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.h, left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hanoi',
                        style: TextStyle(
                          color: Styles.whiteColor,
                          fontSize: 45.sp,
                          fontWeight: Styles.boldText,
                        ),
                      ),
                      DefaultSizedBox.vertical(15),
                      Text(
                        'Vietnam’s capital, home to Bach Ma Temple, Đồng Xuân Market & neoclassical Hanoi Opera House.',
                        style: TextStyle(
                          fontSize: Styles.regularFontSize,
                          color: Styles.whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          DefaultSizedBox.vertical(25),
          DefaultPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.topSights.tr(),
                  style: TextStyle(
                    color: Styles.primaryColor,
                    fontSize: 21.sp,
                    fontWeight: Styles.boldText,
                  ),
                ),
                DefaultSizedBox.vertical(15),
                Text(
                  AppStrings.topSightsInfoText.tr(),
                  style: TextStyle(
                    color: Styles.primaryColor,
                    fontSize: Styles.regularFontSize,
                  ),
                ),
              ],
            ),
          ),
          DefaultSizedBox.vertical(10),
          Container(
            height: 240.h,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Map<String, dynamic> sight = _sights[index];

                  return Row(
                    children: [
                      if (index == 0)
                        DefaultSizedBox.horizontal(
                            kDefaultScreenHorizontalPadding - 10),
                      CustomShadowContainer(
                        width: 185.w,
                        height: 230.h,
                        borderRadius: BorderRadius.circular(10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.h),
                                topRight: Radius.circular(10.h),
                              ),
                              child: DefaultCacheNetworkImage(
                                imageUrl: sight['image'],
                                height: 135.h,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 12.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 32.h,
                                      child: Text(
                                        sight['name'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: Styles.regularFontSize,
                                            fontWeight: Styles.boldText),
                                      ),
                                    ),
                                    DefaultSizedBox.vertical(5),
                                    Row(
                                      children: [
                                        Text(
                                          sight['rating'].toStringAsFixed(1),
                                          style: TextStyle(
                                            color: Styles.suvaGrey,
                                            fontSize: Styles.smallerRegularSize,
                                          ),
                                        ),
                                        DefaultSizedBox.horizontal(5),
                                        RatingBar.builder(
                                          initialRating: sight['rating'],
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemSize: 10.h,
                                          ignoreGestures: true,
                                          allowHalfRating: true,
                                          itemPadding: EdgeInsets.symmetric(
                                            horizontal: 3.0.w,
                                          ),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.yellow[600],
                                          ),
                                          onRatingUpdate: (selectedRating) {},
                                        ),
                                        DefaultSizedBox.horizontal(5),
                                        Text(
                                          '(${sight['rating_count']})',
                                          style: TextStyle(
                                            color: Styles.suvaGrey,
                                            fontSize: Styles.smallerRegularSize,
                                          ),
                                        ),
                                      ],
                                    ),
                                    DefaultSizedBox.vertical(8),
                                    Text(
                                      sight['description'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Styles.fontSize10,
                                          color: Styles.suvaGrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DefaultSizedBox.horizontal(
                        index < _sights.length - 1
                            ? 15
                            : kDefaultScreenHorizontalPadding.w - 10.w,
                      ),
                    ],
                  );
                },
                itemCount: _sights.length,
              ),
            ),
          ),
          DefaultSizedBox.vertical(15),
        ],
      ),
    );
  }
}
