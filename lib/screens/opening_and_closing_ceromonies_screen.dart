import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../styles.dart';
import '../widgets/custom_shadow_container.dart';
import '../icon_image_path.dart';
import '../globals.dart';
import '../widgets/default_padding.dart';
import '../widgets/weather_indicator.dart';
import '../utils/date_format_utils.dart';
import '../widgets/default_sized_box.dart';

class OpeningAndClosingCeromoniesScreen extends StatelessWidget {
  static const routeName = '/OpeningAndClosingCeromonies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.openingAndClosingCeromonies.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    AppImages.openingAndClosingCeromonies,
                    width: Globals().getScreenWidth(),
                    height: Globals().getScreenHeight() * 0.32,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    color: Styles.primaryDarkColor,
                    child: DefaultPadding(
                      child: Text(
                        '*${AppStrings.ceromoniesTimeInfo.tr()}',
                        style: TextStyle(
                          fontSize: Styles.smallerTitleFontSize,
                          color: Styles.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  CeromonyContainer(
                    hasPassed: true,
                  ),
                  DefaultSizedBox.vertical(15),
                  CeromonyContainer(
                    startTime: DateTime.parse('2021-12-08 20:00:00'),
                    endTime: DateTime.parse('2021-12-08 23:00:00'),
                    isClosing: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CeromonyContainer extends StatelessWidget {
  final bool isClosing;
  final DateTime? startTime;
  final DateTime? endTime;
  final String location;
  final bool isNight;
  final bool hasPassed;
  final String weatherValue;

  CeromonyContainer({
    this.isClosing = false,
    this.startTime,
    this.endTime,
    this.location = 'Mỹ Đình National Stadium',
    this.isNight = true,
    this.hasPassed = false,
    this.weatherValue = '25º / 23º',
  });

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      roundedCorner: false,
      topPadding: 25,
      bottomPadding: 25,
      child: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormatUtils.combineStartDateAndEndDate(
                        startTime ?? DateTime.parse('2021-11-21 20:00:00'),
                        endTime ?? DateTime.parse('2021-11-21 23:00:00'),
                      ),
                      style: TextStyle(
                          color: hasPassed
                              ? Styles.suvaGrey
                              : Styles.primaryDarkColor,
                          fontWeight: Styles.boldText,
                          fontSize: Styles.smallerTitleFontSize),
                    ),
                    DefaultSizedBox.vertical(8),
                    Text(
                      location,
                      style: TextStyle(
                          color: hasPassed
                              ? Styles.suvaGrey
                              : Styles.primaryDarkColor,
                          fontWeight: Styles.boldText,
                          fontSize: Styles.smallerTitleFontSize),
                    ),
                  ],
                ),
                DefaultSizedBox.horizontal(10),
                WeatherIndicator(
                  isNight: true,
                  value: weatherValue,
                  iconColor:
                      hasPassed ? Styles.suvaGrey : Styles.primaryDarkColor,
                  fontColor: hasPassed ? Styles.suvaGrey : Styles.primaryColor,
                ),
              ],
            ),
            DefaultSizedBox.vertical(15),
            Text(
              (isClosing ? AppStrings.closingCeromony : AppStrings.openCeromony)
                  .tr(),
              style: TextStyle(
                fontSize: Styles.regularFontSize,
                color: hasPassed ? Styles.suvaGrey : Styles.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
