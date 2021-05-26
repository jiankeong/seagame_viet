import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/custom_shadow_container.dart';
import '../widgets/default_padding.dart';
import '../globals.dart';
import '../widgets/default_cache_network_image.dart';
import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/default_divider.dart';
import '../icon_image_path.dart';
import '../utils/date_format_utils.dart';
import '../widgets/sport_icon_container.dart';
import '../screens/news_detail_screen.dart';

class NewsMenuScreen extends StatefulWidget {
  static const routeName = '/NewsMenu';

  @override
  _NewsMenuScreenState createState() => _NewsMenuScreenState();
}

class _NewsMenuScreenState extends State<NewsMenuScreen> {
  final List<Map<String, dynamic>> _highLights = [
    {
      "image":
          'https://apicms.thestar.com.my/uploads/images/2020/02/29/582079.jpg',
      "title": 'Lee to face against old rivals. Will he prevail?',
    },
    {
      "image":
          "https://img.jakpost.net/c/2020/02/24/2020_02_24_87252_1582536589._large.jpg",
      "title": "Malaysian Ends the Prelims with a Dunk.",
    },
    {
      "image":
          "https://images.theconversation.com/files/400718/original/file-20210514-17-1huj66d.jpg?ixlib=rb-1.1.0&rect=6%2C125%2C4625%2C2312&q=45&auto=format&w=668&h=324&fit=crop",
      "title": "A Team Effort to break past obstacles",
    },
  ];

  final List<Map<String, dynamic>> _updates = [
    {
      "image":
          "https://img.jakpost.net/c/2020/02/24/2020_02_24_87252_1582536589._large.jpg",
      "title": "Malaysian Ends the Prelims with a Dunk.",
      "date": "2021-05-21 00:00:00",
      "author": "Colin Ward-Henninger",
      "type": "Basketball",
      "icon": AppIcons.basketball,
    },
    {
      "image":
          "https://images.theconversation.com/files/400718/original/file-20210514-17-1huj66d.jpg?ixlib=rb-1.1.0&rect=6%2C125%2C4625%2C2312&q=45&auto=format&w=668&h=324&fit=crop",
      "title": "A Team Effort to break past obstacles",
      "date": "2021-05-21 00:00:00",
      "author": "Colin Ward-Henninger",
      "type": "Football",
      "icon": AppIcons.football,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultAppBar(
            title: AppStrings.news.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomShadowContainer(
                    roundedCorner: false,
                    height: Globals().getScreenHeight() * 0.35,
                    topPadding: 20,
                    bottomPadding: 20,
                    leftPadding: 25,
                    rightPadding: 25,
                    child: InkWell(
                      onTap: () {
                        moveToDetail(0);
                      },
                      child: Container(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.h),
                              child: DefaultCacheNetworkImage(
                                imageUrl:
                                    'https://badmintonfamly.com/wp-content/uploads/2018/05/Lee-Chong-Wei-ny.jpg',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              bottom: 20.0,
                              left: 25.0,
                              width: Globals().getScreenWidth() * 0.65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Badminton'.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: Styles.boldText,
                                        fontSize: 15.sp,
                                        color: Styles.whiteColor),
                                  ),
                                  DefaultSizedBox.vertical(15),
                                  Text(
                                    'Lee smashing through the quaterfinals with straight wins',
                                    style: TextStyle(
                                      color: Styles.whiteColor,
                                      fontSize: 23.sp,
                                      fontWeight: Styles.boldText,
                                    ),
                                  ),
                                  DefaultSizedBox.vertical(15),
                                  Text(
                                    '1 Hour ago • Colin Ward-Henninger',
                                    style: TextStyle(
                                      color: Styles.whiteColor,
                                      fontSize: 15.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DefaultSizedBox.vertical(25),
                  DefaultPadding(
                    child: Text(
                      AppStrings.highlights.tr(),
                      style: Styles.sectionTitleTextStyle,
                    ),
                  ),
                  DefaultSizedBox.vertical(20),
                  Container(
                    height: 181.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> highlight = _highLights[index];

                        return Row(
                          children: [
                            if (index == 0) DefaultSizedBox.horizontal(20),
                            InkWell(
                              onTap: () {
                                moveToDetail(0);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomShadowContainer(
                                    width: 230.w,
                                    height: 126.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.h),
                                      child: DefaultCacheNetworkImage(
                                        imageUrl: highlight['image'],
                                      ),
                                    ),
                                  ),
                                  DefaultSizedBox.vertical(15),
                                  Container(
                                    width: 230.w,
                                    child: Text(
                                      highlight['title'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: Styles.smallerTitleFontSize,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            DefaultSizedBox.horizontal(
                              index < _highLights.length - 1 ? 15 : 20,
                            ),
                          ],
                        );
                      },
                      itemCount: _highLights.length,
                    ),
                  ),
                  DefaultSizedBox.vertical(30),
                  DefaultDivider(
                    thickness: 1.0.w,
                  ),
                  DefaultSizedBox.vertical(25),
                  DefaultPadding(
                    child: Text(
                      AppStrings.updates.tr(),
                      style: Styles.sectionTitleTextStyle,
                    ),
                  ),
                  DefaultSizedBox.vertical(20),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> update = _updates[index];

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SportIconContainer(
                                              icon: update['icon'],
                                              size: 30,
                                            ),
                                            DefaultSizedBox.horizontal(10),
                                            Flexible(
                                              child: Text(
                                                update['type'],
                                                style: TextStyle(
                                                  fontSize:
                                                      Styles.regularFontSize,
                                                  color: Styles.primaryColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        DefaultSizedBox.vertical(10),
                                        Text(
                                          update['title'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize:
                                                Styles.smallerTitleFontSize,
                                          ),
                                        ),
                                        DefaultSizedBox.vertical(10),
                                        Text(
                                          '${DateFormatUtils.ddMMMyyyFormat1(
                                            DateTime.parse(update['date']),
                                          )} \u2022 ${update['author']}',
                                          style: TextStyle(
                                              fontSize:
                                                  Styles.smallerRegularSize,
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
                    itemCount: _updates.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void moveToDetail(int id) {
    Navigator.pushNamed(context, NewsDetailScreen.routeName, arguments: {
      "id": id,
    });
  }
}
