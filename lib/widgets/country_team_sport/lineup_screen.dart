import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../custom_shadow_container.dart';
import '../../icon_image_path.dart';
import '../../styles.dart';
import '../profile_avatar.dart';
import '../../utils/enums.dart';
import '../default_padding.dart';
import '../../app_strings.dart';
import '../default_sized_box.dart';
import '../default_divider.dart';
import '../info_vertical_layout.dart';

class LineupScreen extends StatelessWidget {
  final Map<String, dynamic>? country;

  LineupScreen({this.country});

  final List<Map<String, dynamic>> playerList = [
    {
      'no': '4',
      'name': 'V.H. ANG',
      'pos': 'SG',
    },
    {
      'no': '5',
      'name': 'K.F. LEONG',
      'pos': 'SG',
    },
    {
      'no': '6',
      'name': 'C.C. Wee',
      'pos': 'SG',
    },
    {
      'no': '7',
      'name': 'Y.X. LEONG',
      'pos': 'SG',
    },
    {
      'no': '8',
      'name': 'Z.W. HOO',
      'pos': 'SG',
    },
  ];

  final TextStyle infoListing = TextStyle(
    color: Styles.primaryDarkColor,
    fontSize: Styles.titleFontSize,
    fontWeight: Styles.boldText,
  );

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
                          radius: 32,
                          imageType: ImageType.asset,
                          profileImgUrl:
                              country != null && country!['flag'] != null
                                  ? country!['flag']
                                  : null),
                      DefaultSizedBox.horizontal(15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country!['name'].toString().tr(),
                              style: TextStyle(
                                fontSize: 21.sp,
                                fontWeight: Styles.boldText,
                                color: Styles.whiteColor,
                              ),
                            ),
                            DefaultSizedBox.vertical(5),
                            Text(
                              '${AppStrings.confederation.tr()}: MABA',
                              style: TextStyle(
                                fontSize: Styles.regularFontSize,
                                color: Styles.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultSizedBox.horizontal(15),
                Image.asset(
                  AppImages.goldMedal,
                  width: 30.h,
                  height: 30.h,
                  fit: BoxFit.contain,
                )
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
                title: AppStrings.squadSize.tr().toUpperCase(),
                value: '12',
              ),
              InfoVerticalLayout(
                title: AppStrings.ranking.tr().toUpperCase(),
                value: '121',
              ),
              InfoVerticalLayout(
                title: AppStrings.averageAge.tr().toUpperCase(),
                value: null,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Styles.whiteColor,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
            ),
            child: DefaultPadding(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: RankingLabelText(
                          title: AppStrings.no.tr().toUpperCase(),
                        ),
                      ),
                      DefaultSizedBox.horizontal(5),
                      Expanded(
                        flex: 7,
                        child: RankingLabelText(
                          title: AppStrings.name.tr().toUpperCase(),
                        ),
                      ),
                      DefaultSizedBox.horizontal(5),
                      Expanded(
                        flex: 1,
                        child: RankingLabelText(
                          title: AppStrings.pos.tr().toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Map<String, dynamic> player = playerList[index];

                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Row(children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                player['no'],
                                style: infoListing,
                              ),
                            ),
                            DefaultSizedBox.horizontal(5),
                            Expanded(
                              flex: 7,
                              child: Text(
                                player['name'],
                                style: infoListing,
                              ),
                            ),
                            DefaultSizedBox.horizontal(5),
                            Expanded(
                              flex: 1,
                              child: Text(
                                player['pos'],
                                style: infoListing,
                              ),
                            ),
                          ]),
                        ),
                        if (index < playerList.length - 1)
                          DefaultDivider(
                            thickness: 1.0.h,
                          ),
                      ]);
                    },
                    itemCount: playerList.length,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RankingLabelText extends StatelessWidget {
  final String? title;

  RankingLabelText({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        color: Styles.suvaGrey,
        fontSize: Styles.regularFontSize,
      ),
    );
  }
}
