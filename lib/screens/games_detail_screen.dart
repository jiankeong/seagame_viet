import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_games_gms/icon_image_path.dart';

import '../widgets/default_sized_box.dart';
import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_cache_network_image.dart';
import '../globals.dart';
import '../styles.dart';
import '../widgets/default_padding.dart';
import '../widgets/oval_button.dart';

class GamesDetailScreen extends StatelessWidget {
  static const routeName = '/GamesDetail';

  final TextStyle contentTextStyle = TextStyle(
    fontSize: Styles.regularFontSize,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.boccia.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultCacheNetworkImage(
                    imageUrl:
                        // 'https://archery360.com/wp-content/uploads/2014/05/1501094_10152378052259583_8253477998887956205_o.jpg',
                        "https://bocciacanada.ca/wp-content/uploads/2016/02/boccia.jpg",
                    width: double.infinity,
                    height: Globals().getScreenHeight() * 0.28,
                  ),
                  DefaultSizedBox.vertical(15),
                  DefaultPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // 'Photo by Archery 360',
                          'Photo by Boccia Canada',
                          style: TextStyle(
                            fontSize: Styles.smallerRegularSize,
                            color: Styles.creditToColor,
                          ),
                        ),
                        DefaultSizedBox.vertical(30),
                        Text(
                          // AppStrings.archeryDetail1.tr(),
                          AppStrings.bocciaDetail1.tr(),
                          style: contentTextStyle,
                        ),
                        DefaultSizedBox.vertical(20),
                        Text(
                          AppStrings.overview.tr(),
                          style: Styles.sectionTitleTextStyle,
                        ),
                        DefaultSizedBox.vertical(20),
                        Text(
                          // AppStrings.archeryDetail2.tr(),
                          AppStrings.bocciaDetail2.tr(),
                          style: contentTextStyle,
                        ),
                        DefaultSizedBox.vertical(35),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.symmetric(
                  //     vertical: 25.h,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         AppImages.eventProgrammeBanner,
                  //       ),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  //   child: DefaultPadding(
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Flexible(
                  //               child: Text(
                  //                 AppStrings.eventProgramme.tr(),
                  //                 style: TextStyle(
                  //                   fontSize: 21.sp,
                  //                   color: Styles.whiteColor,
                  //                   fontWeight: Styles.boldText,
                  //                 ),
                  //               ),
                  //             ),
                  //             DefaultSizedBox.horizontal(10),
                  //             OvalButton(
                  //               buttonText: AppStrings.viewSchedule.tr(),
                  //               color: Styles.whiteColor,
                  //               fontColor: Styles.primaryColor,
                  //             ),
                  //           ],
                  //         ),
                  //         DefaultSizedBox.vertical(15),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               '\u2022 ${AppStrings.individualCompetition.tr()} (${AppStrings.menOrWomen.tr()})',
                  //               style: TextStyle(
                  //                 fontSize: Styles.regularFontSize,
                  //                 color: Styles.whiteColor,
                  //               ),
                  //             ),
                  //             DefaultSizedBox.vertical(10),
                  //             Text(
                  //               '\u2022 ${AppStrings.teamCompetition.tr()} (${AppStrings.menOrWomen.tr()})',
                  //               style: TextStyle(
                  //                 fontSize: Styles.regularFontSize,
                  //                 color: Styles.whiteColor,
                  //               ),
                  //             ),
                  //             DefaultSizedBox.vertical(10),
                  //             Text(
                  //               '\u2022 ${AppStrings.mixedTeam.tr()}',
                  //               style: TextStyle(
                  //                 fontSize: Styles.regularFontSize,
                  //                 color: Styles.whiteColor,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  DefaultCacheNetworkImage(
                    imageUrl:
                        // 'https://media-exp1.licdn.com/dms/image/C4D1BAQHvqoxbYPFbmQ/company-background_10000/0/1547759570555?e=2159024400&v=beta&t=F7fhSvIXC_Zn5wjaOZZonJHY6JWyLDKlZmb7RFzk-aQ',
                        'https://www.paralympic.org/sites/default/files/styles/image_crop_16_9_800_450/public/images/121126144243663_151227999_0.jpg?itok=eSVOVCJd',
                    width: double.infinity,
                    height: Globals().getScreenHeight() * 0.28,
                  ),
                  DefaultSizedBox.vertical(30),
                  DefaultPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.essenceOfSport.tr(),
                          style: Styles.sectionTitleTextStyle,
                        ),
                        DefaultSizedBox.vertical(20),
                        Text(
                          // AppStrings.archeryDetail3.tr(),
                          AppStrings.bocciaDetail3.tr(),
                          style: contentTextStyle,
                        )
                      ],
                    ),
                  ),
                  DefaultSizedBox.vertical(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
