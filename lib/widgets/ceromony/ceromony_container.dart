import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';
import '../default_sized_box.dart';
import '../../utils/date_format_utils.dart';
import '../default_padding.dart';
import '../weather_indicator.dart';
import '../../app_strings.dart';
import '../custom_shadow_container.dart';
import '../default_button.dart';

class CeromonyContainer extends StatefulWidget {
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
  _CeromonyContainerState createState() => _CeromonyContainerState();
}

class _CeromonyContainerState extends State<CeromonyContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: CustomShadowContainer(
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
                          widget.startTime ??
                              DateTime.parse('2021-11-21 20:00:00'),
                          widget.endTime ??
                              DateTime.parse('2021-11-21 23:00:00'),
                        ),
                        style: TextStyle(
                            color: widget.hasPassed
                                ? Styles.suvaGrey
                                : Styles.primaryDarkColor,
                            fontWeight: Styles.boldText,
                            fontSize: Styles.smallerTitleFontSize),
                      ),
                      DefaultSizedBox.vertical(8),
                      Text(
                        widget.location,
                        style: TextStyle(
                            color: widget.hasPassed
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
                    value: widget.weatherValue,
                    iconColor: widget.hasPassed
                        ? Styles.suvaGrey
                        : Styles.primaryDarkColor,
                    fontColor: widget.hasPassed
                        ? Styles.suvaGrey
                        : Styles.primaryColor,
                  ),
                ],
              ),
              DefaultSizedBox.vertical(15),
              Text(
                (widget.isClosing
                        ? AppStrings.closingCeromony
                        : AppStrings.openCeromony)
                    .tr(),
                style: TextStyle(
                  fontSize: Styles.regularFontSize,
                  color:
                      widget.hasPassed ? Styles.suvaGrey : Styles.primaryColor,
                ),
              ),
              Center(
                child: Visibility(
                    visible: isExpanded,
                    child: Column(
                      children: [
                        DefaultSizedBox.vertical(25),
                        DefaultButton(
                          width: 213.w,
                          buttonText: AppStrings.setReminder.tr(),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
