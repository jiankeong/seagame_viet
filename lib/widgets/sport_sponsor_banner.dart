import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import './weather_indicator.dart';
import './custom_shadow_container.dart';
import './default_sized_box.dart';
import '../utils/date_format_utils.dart';
import './default_cache_network_image.dart';
import '../utils/general_functions.dart';
import '../icon_image_path.dart';

class SportSponsorBanner extends StatelessWidget {
  final String sponsorImgUrl;
  final String sport;
  final DateTime? startTime;
  final DateTime? endTime;

  SportSponsorBanner({
    this.sponsorImgUrl =
        'https://lh3.googleusercontent.com/proxy/xjq-hD8lzLATirZLvp9XZTJWFYSyUYN-V-U011BJZQjRSCAGVPnJlBI7s0CcsrKzqFepnkXvvPyI7QF4Kam-1ojHexQekWUWp8hOnLy7_sKblrwOl0HV1okJz8Rx',
    this.sport = 'Badminton',
    this.startTime,
    this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      roundedCorner: false,
      backgroundImage: AppImages.liveBanner,
      height: 75.h,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: DefaultCacheNetworkImage(
              imageUrl: sponsorImgUrl,
              width: 120.h,
              height: 120.h,
              boxFit: BoxFit.contain,
            ),
          ),
          DefaultSizedBox.horizontal(25),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sport,
                            style: TextStyle(
                                color: Styles.whiteColor,
                                fontWeight: Styles.boldText,
                                fontSize: Styles.smallerTitleFontSize),
                          ),
                          DefaultSizedBox.vertical(3),
                          Text(
                            DateFormatUtils.combineStartDateAndEndDate(
                              startTime ??
                                  DateTime.parse('2021-12-03 20:00:00'),
                              endTime ?? DateTime.parse('2021-12-03 23:00:00'),
                            ),
                            style: TextStyle(
                              fontSize: Styles.smallerRegularSize,
                              color: Styles.whiteColor,
                              fontWeight: Styles.boldText,
                            ),
                          ),
                          DefaultSizedBox.vertical(3),
                          InkWell(
                            onTap: () {
                              launchURL();
                            },
                            child: Text(
                              'Mỹ Đình National Stadium',
                              style: TextStyle(
                                fontSize: Styles.smallerRegularSize,
                                color: Styles.whiteColor,
                                fontWeight: Styles.boldText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: WeatherIndicator(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
