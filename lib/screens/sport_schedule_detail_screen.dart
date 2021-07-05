import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_games_gms/widgets/default_sized_box.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/custom_shadow_container.dart';
import '../widgets/country_flag_container.dart';
import '../widgets/default_button.dart';
import '../widgets/default_padding.dart';
import '../styles.dart';
import '../globals.dart';
import '../widgets/default_cache_network_image.dart';
import '../widgets/sport_sponsor_banner.dart';
import '../icon_image_path.dart';

class SportScheduleDetailScreen extends StatefulWidget {
  static const routeName = '/SportSchedule';

  @override
  _SportScheduleDetailScreenState createState() =>
      _SportScheduleDetailScreenState();
}

class _SportScheduleDetailScreenState extends State<SportScheduleDetailScreen> {
  String chosenSport = AppStrings.paraSwimming;

  bool isInit = true;

  Map<String, dynamic> _scheduleDetails = {
    "id": 1,
    "banner":
        "https://swimswam.com/wp-content/uploads/2016/09/BB3_4344.jpg",
    "sponsor_logo":
        "https://lh3.googleusercontent.com/proxy/xjq-hD8lzLATirZLvp9XZTJWFYSyUYN-V-U011BJZQjRSCAGVPnJlBI7s0CcsrKzqFepnkXvvPyI7QF4Kam-1ojHexQekWUWp8hOnLy7_sKblrwOl0HV1okJz8Rx",
    "sport": "Para Swimming",
    "start_time": "2021-12-01 09:00:00",
    "end_time": "2021-12-01 12:30:00",
    "location": "ISA SPORTS CITY",
    "is_night": false,
    "min_temp": 27,
    "max_temp": 29,
    "events": [
      {
        "name": "Women’s Backstroke 400m Final",
        "players": [
          {
            "lane": "-",
            "country_flag": AppImages.indonesia,
            "country_code": "INA",
            "name": "M.Z. Lalu",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
          {
            "lane": "-",
            "country_flag": AppImages.brunei,
            "country_code": "BRU",
            "name": "C.C. Ali",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
          {
            "lane": "-",
            "country_flag": AppImages.cambodia,
            "country_code": "CAM",
            "name": "B.C. Bin",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
          {
            "lane": "-",
            "country_flag": AppImages.laos,
            "country_code": "LAO",
            "name": "Y.I. Lee",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
          {
            "lane": "-",
            "country_flag": AppImages.malaysia,
            "country_code": "MAS",
            "name": "C.W. Lee",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
          {
            "lane": "-",
            "country_flag": AppImages.myanmar,
            "country_code": "MYA",
            "name": "K.L. Sin",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
          {
            "lane": "-",
            "country_flag": AppImages.thailand,
            "country_code": "THA",
            "name": "Q.Q. Ten",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
          {
            "lane": "-",
            "country_flag": AppImages.singapore,
            "country_code": "INA",
            "name": "A. Lee",
            "sb": "2:16:27",
            "pb": "2:16:27",
          },
        ]
      }
    ]
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      if (args != null) {}
    }

    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: chosenSport.tr(),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                DefaultCacheNetworkImage(
                  imageUrl: _scheduleDetails['banner'],
                  width: double.infinity,
                  height: Globals().getScreenHeight() * 0.3,
                ),
                SportSponsorBanner(
                  sport: _scheduleDetails['sport'],
                  sponsorImgUrl: _scheduleDetails['sponsor_logo'],
                ),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> event =
                        _scheduleDetails['events'][index];

                    return Column(
                      children: [
                        CustomShadowContainer(
                          roundedCorner: false,
                          topPadding: 20.h,
                          bottomPadding: 20.h,
                          child: DefaultPadding(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event['name'].toString().toUpperCase(),
                                  style: TextStyle(
                                      color: Styles.primaryColor,
                                      fontSize: Styles.regularFontSize),
                                ),
                                DefaultSizedBox.vertical(15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: SportScheduleDetailTableTitle(
                                          title: AppStrings.lane.tr(),
                                        ),
                                      ),
                                    ),
                                    DefaultSizedBox.horizontal(5),
                                    Expanded(
                                      flex: 5,
                                      child: SportScheduleDetailTableTitle(
                                        title: AppStrings.name.tr(),
                                      ),
                                    ),
                                    DefaultSizedBox.horizontal(5),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: SportScheduleDetailTableTitle(
                                          title: "SB",
                                        ),
                                      ),
                                    ),
                                    DefaultSizedBox.horizontal(5),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: SportScheduleDetailTableTitle(
                                          title: "PB",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                DefaultSizedBox.vertical(10),
                                for (Map<String, dynamic> player
                                    in event['players'])
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              player['lane'],
                                              style: TextStyle(
                                                  fontSize: Styles
                                                      .smallerRegularSize,
                                                  color: Styles
                                                      .primaryDarkColor),
                                            ),
                                          ),
                                        ),
                                        DefaultSizedBox.horizontal(5),
                                        Expanded(
                                          flex: 5,
                                          child: Row(
                                            children: [
                                              CountryFlagContainer(
                                                countryFlag:
                                                    player['country_flag'],
                                                width: 29.w,
                                                height: 19.w,
                                                hasShadow: true,
                                              ),
                                              DefaultSizedBox.horizontal(5),
                                              Text(
                                                player['country_code'],
                                                style: TextStyle(
                                                  fontSize: Styles
                                                      .smallerRegularSize,
                                                  color:
                                                      Styles.primaryDarkColor,
                                                  fontWeight: Styles.boldText,
                                                ),
                                              ),
                                              DefaultSizedBox.horizontal(10),
                                              Text(
                                                player['name'],
                                                style: TextStyle(
                                                  fontSize: Styles
                                                      .smallerRegularSize,
                                                  color:
                                                      Styles.primaryDarkColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        DefaultSizedBox.horizontal(5),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              player['sb'],
                                              style: TextStyle(
                                                color:
                                                    Styles.primaryDarkColor,
                                                fontSize:
                                                    Styles.smallerRegularSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DefaultSizedBox.horizontal(5),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              player['pb'],
                                              style: TextStyle(
                                                color:
                                                    Styles.primaryDarkColor,
                                                fontSize:
                                                    Styles.smallerRegularSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        DefaultSizedBox.vertical(15)
                      ],
                    );
                  },
                  itemCount: _scheduleDetails['events'].length,
                ),
              ],
            ),
          ),
          Container(
            color: Styles.whiteColor,
            width: double.infinity,
            padding: EdgeInsets.only(top: 15.h, bottom: 30.h),
            child: DefaultPadding(
              child: DefaultButton(
                width: 213.w,
                buttonText: AppStrings.setReminder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SportScheduleDetailTableTitle extends StatelessWidget {
  final String title;

  SportScheduleDetailTableTitle({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
          color: Styles.suvaGrey,
          fontWeight: Styles.boldText,
          fontSize: Styles.smallerRegularSize),
    );
  }
}
