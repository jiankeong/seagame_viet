import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../styles.dart';
import '../default_sized_box.dart';
import './schedule_constant.dart';
import './schedule_dot.dart';
import '../../screens/opening_and_closing_ceromonies_screen.dart';
import '../../screens/sport_schedule_list_screen.dart';
import '../../icon_image_path.dart';

class ScheduleTable extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final List<Map<String, dynamic>> sports;

  ScheduleTable({
    DateTime? startDate,
    DateTime? endDate,
    List<Map<String, dynamic>>? sports,
  })  : startDate = startDate == null ? DateTime.now() : startDate,
        endDate = endDate == null ? DateTime.now() : endDate,
        sports = sports == null ? [] : sports;

  @override
  _ScheduleTableState createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  int days = 0;

  List<DateTime> totalDays = [];

  @override
  void initState() {
    super.initState();

    days = widget.endDate.difference(widget.startDate).inDays + 1;

    for (int i = 0; i < days; i++) {
      totalDays.add(widget.startDate.add(Duration(days: i)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: kTimetableSideBarWidth.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimeline(),
            _buildTimbeTableEventContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (DateTime day in totalDays)
          Column(
            children: [
              Container(
                width: kTimetableContainerWidth.w,
                height: kTimetableHeaderRowHeight.h,
                color: Styles.whiteSmoke,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.w,
                ),
                child: Column(
                  children: [
                    Text(
                      DateFormat('MMM').format(day),
                      style: TextStyle(
                        fontWeight: Styles.boldText,
                        fontSize: Styles.smallerRegularSize,
                      ),
                    ),
                    DefaultSizedBox.vertical(3),
                    Text(
                      '${day.day}',
                      style: TextStyle(
                        fontWeight: Styles.boldText,
                        fontSize: 19.sp,
                      ),
                    ),
                    DefaultSizedBox.vertical(3),
                    Text(
                      DateFormat('EEE').format(day),
                      style: TextStyle(
                        fontWeight: Styles.boldText,
                        fontSize: Styles.smallerRegularSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: kTimetableContainerWidth.w,
                color: Styles.suvaGrey,
                height: kTimetableHeaderBodyDividerHeight.h,
              )
            ],
          )
      ],
    );
  }

  Widget _buildTimbeTableEventContainer() {
    return Column(
      children: [
        for (int row = 0; row < widget.sports.length; row++)
          InkWell(
            onTap: () {
              String routeName = OpeningAndClosingCeromoniesScreen.routeName;

              if (row > 0) {
                routeName = SportScheduleListScreen.routeName;
              }

              Navigator.pushNamed(context, routeName);
            },
            child: Row(
              children: [
                for (int column = 0; column < totalDays.length; column++)
                  Container(
                    width: kTimetableContainerWidth.w,
                    height: kTimetableDataContainerRowHeight.h,
                    color: row % 2 == 0 ? Styles.whiteColor : Styles.whiteSmoke,
                    child: Center(
                      child: randomEventMapper(row, column),
                    ),
                  )
              ],
            ),
          ),
      ],
    );
  }

  int randomEvent() {
    Random rng = Random();

    return rng.nextInt(3);
  }

  Widget randomEventMapper(int row, int column) {
    if (row == 0) {
      if (column == 0 || column == totalDays.length - 1)
        return ScheduleDot();
      else
        return Container();
    }

    int event = randomEvent();

    switch (event) {
      case 1:
        return ScheduleDot();
      case 2:
        return Image.asset(
          AppIcons.scheduleMedal,
          width: 19.h,
          height: 19.h,
        );
      default:
        return Container();
    }
  }
}
