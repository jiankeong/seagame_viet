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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpyEaK-NyAPIf12bTIH46AEEU7W65Dc_ddgSkIleRKxQisY6-KyLO3w-ZFpsWhQJJsy7JaGjBoSsYau740ycIP0g",
      "name": "Bahrain Fort",
      "description":
          "The Qal'at al-Bahrain, also known as the Bahrain Fort or Portuguese Fort, is an archaeological site located in Bahrain. Archaeological excavations carried out since 1954 have unearthed antiquities from an artificial mound of 12 m height containing seven stratified layers, created by various occupants from 2300 BC up to the 18th century, including Kassites, Greeks, Portuguese and Persians. It was once the capital of the Dilmun civilization and was inscribed as a UNESCO World Heritage Site in 2005",
      "rating": Random().nextDouble() * (5 - 3.5) + 3.5,
      "rating_count": Random().nextInt(9999),
    },
    {
      "image": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT9km7zqkdNTXxk_ESD61R5rocVTxph8YOGkX1G9RBmuVPOJ-zvSFLykyxFi3LiyliuomWIlLHLvzAo3KaXpM-DvQ",
      "name": " Bahrain National Museum",
      "description": "The Bahrain National Museum is the largest and oldest public museum in Bahrain. It is situated in Manama, adjacent to the National Theatre of Bahrain.",
      "rating": Random().nextDouble() * (5 - 3.5) + 3.5,
      "rating_count": Random().nextInt(9999),
    },
    {
      "image":
          "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQRoZsJtbFpgnSwC9nemURVZ4l0wX75sCDv84IEdWMzu6b023NixVg1npEkqsdz-qJJJ3q9TnhDn_fLkhgpQR9_cQ",
      "name": "Al Fateh Grand Mosque",
      "description":
          "The Al-Fateh Mosque is one of the largest mosques in the world, encompassing 6,500 square meters and having the capacity to accommodate over 7,000 worshippers at a time.",
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
                    'https://cdn.expatwoman.com/s3fs-public/bahrain-main.jpg',
                width: double.infinity,
                height: Globals().getScreenHeight() * 0.38,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
                child: SearchContainer(
                  hintText: "Manama",
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
                        'Manama',
                        style: TextStyle(
                          color: Styles.whiteColor,
                          fontSize: 45.sp,
                          fontWeight: Styles.boldText,
                        ),
                      ),
                      DefaultSizedBox.vertical(15),
                      Text(
                        'Arabic Al-Manāmah, capital and largest city of Bahrain. It lies at the northeast tip of Bahrain island, in the Persian Gulf.',
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
