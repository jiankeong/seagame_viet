import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import './schedule_constant.dart';
import '../../app_strings.dart';
import '../../styles.dart';
import '../default_padding.dart';

class ScheduleSideBar extends StatelessWidget {
  final List<Map<String, dynamic>> sports;

  ScheduleSideBar({List<Map<String, dynamic>>? sports})
      : sports = sports == null ? [] : sports;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        _buildSport(),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Container(
          width: kTimetableSideBarWidth.w,
          height: kTimetableHeaderRowHeight.h,
          color: Styles.whiteSmoke,
          child: Align(
            alignment: Alignment.centerLeft,
            child: DefaultPadding(
              child: Text(
                AppStrings.sports.tr(),
                style: TextStyle(
                  fontWeight: Styles.boldText,
                  fontSize: Styles.smallerRegularSize,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: kTimetableSideBarWidth.w,
          color: Styles.suvaGrey,
          height: kTimetableHeaderBodyDividerHeight.h,
        )
      ],
    );
  }

  Widget _buildSport() {
    return Column(
      children: [
        for (int row = 0; row < sports.length; row++)
          Container(
            width: kTimetableSideBarWidth.w,
            height: kTimetableDataContainerRowHeight.h,
            color: row % 2 == 0 ? Styles.whiteColor : Styles.whiteSmoke,
            child: Align(
              alignment: Alignment.centerLeft,
              child: DefaultPadding(
                child: Text(
                  sports[row]['sport'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Styles.smallerRegularSize,
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
