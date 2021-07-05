import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../icon_image_path.dart';
import '../../app_strings.dart';
import '../default_sized_box.dart';
import '../../styles.dart';
import '../../utils/date_format_utils.dart';
import '../weather_indicator.dart';
import '../custom_shadow_container.dart';
import '../default_divider.dart';
import '../country_flag_container.dart';

class CompetitionContainer extends StatelessWidget {
  final DateTime? startTime;
  final DateTime? endTime;
  final String? sport;
  final String? event;
  final String? countryCode;
  final String? countryFlag;
  final String? opponentName;
  final String? location;
  final Function()? onPressed;
  final bool isPrevious;

  CompetitionContainer({
    this.startTime,
    this.endTime,
    this.sport = 'Badminton',
    this.event = 'MEN’S SINGLES SEMIFINALS',
    this.countryCode = 'INA',
    this.countryFlag = AppImages.indonesia,
    this.opponentName = 'C. Jonatan',
    this.location = 'ISA SPORTS CITY',
    this.onPressed,
    this.isPrevious = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CustomShadowContainer(
        backgroundImage: isPrevious
            ? AppImages.competitionContainerInactiveBg
            : AppImages.competitionContainerBg,
        borderRadius: BorderRadius.circular(15.h),
        topPadding: 15,
        bottomPadding: 15,
        leftPadding: 20,
        rightPadding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    (isPrevious
                            ? AppStrings.previousMatch
                            : AppStrings.nextGame)
                        .tr(),
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Styles.whiteColor,
                    ),
                  ),
                ),
                DefaultSizedBox.horizontal(10),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormatUtils.combineStartDateAndEndDate(
                          startTime == null
                              ? DateTime.parse('2021-12-03 18:00:00')
                              : startTime!,
                          endTime == null
                              ? DateTime.parse('2021-12-03 23:00:00')
                              : endTime!,
                        ),
                        style: TextStyle(
                          color: Styles.whiteColor,
                          fontWeight: Styles.boldText,
                          fontSize: Styles.smallerRegularSize,
                        ),
                      ),
                      DefaultSizedBox.vertical(3),
                      Row(
                        children: [
                          Text(
                            location!,
                            style: TextStyle(
                              color: Styles.whiteColor,
                              fontWeight: Styles.boldText,
                              fontSize: Styles.smallerRegularSize,
                            ),
                          ),
                          DefaultSizedBox.horizontal(3),
                          Icon(
                            Icons.place,
                            size: 10,
                            color: Styles.whiteColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                DefaultSizedBox.horizontal(10),
                WeatherIndicator(
                  iconSize: 16,
                  fontSize: Styles.fontSize10,
                ),
              ],
            ),
            DefaultSizedBox.vertical(15),
            Container(
              width: 22.w,
              height: 2,
              color: Styles.whiteColor,
            ),
            DefaultSizedBox.vertical(15),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sport!.toUpperCase(),
                          style: TextStyle(
                            color: Styles.whiteColor,
                            fontSize: Styles.smallerTitleFontSize,
                            fontWeight: Styles.boldText,
                          ),
                        ),
                        DefaultSizedBox.vertical(5),
                        Text(
                          event!.toUpperCase(),
                          style: TextStyle(
                            color: Styles.whiteColor,
                            fontSize: Styles.regularFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultDivider.vertical(
                    color: Styles.whiteColor,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              countryCode!,
                              style: TextStyle(
                                color: Styles.whiteColor,
                                fontWeight: Styles.boldText,
                                fontSize: Styles.regularFontSize,
                              ),
                            ),
                            DefaultSizedBox.horizontal(5),
                            CountryFlagContainer(
                              countryFlag: countryFlag!,
                              width: 19.w,
                              height: 13.h,
                            ),
                          ],
                        ),
                        DefaultSizedBox.vertical(5),
                        Text(
                          opponentName!,
                          textAlign: TextAlign.end,
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
            )
          ],
        ),
      ),
    );
  }
}
