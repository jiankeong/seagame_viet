import 'package:flutter/material.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../icon_image_path.dart';
import '../styles.dart';
import '../widgets/custom_shadow_container.dart';
import '../globals.dart';
import '../app_strings.dart';
import '../widgets/default_padding.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/sport_icon_container.dart';
import '../widgets/default_divider.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/Location';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.locationBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          ExpandableBottomSheet(
            key: key,
            background: Container(
              color: Colors.transparent,
            ),
            persistentHeader: InkWell(
              onTap: () {
                if (key.currentState!.expansionStatus ==
                    ExpansionStatus.expanded) {
                  key.currentState!.contract();
                  setState(() {});
                  return;
                }

                key.currentState!.expand();

                setState(() {});
              },
              child: CustomShadowContainer(
                height: Globals().getScreenHeight() * 0.25,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.h),
                  topRight: Radius.circular(15.h),
                ),
                child: DefaultPadding(
                  top: 20,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                AppIcons.back,
                                width: 25.h,
                                height: 25.h,
                                fit: BoxFit.contain,
                                color: Styles.blackColor,
                              ),
                            ),
                            Text(
                              AppStrings.upcomingMatchNearYou.tr(),
                              style: TextStyle(
                                  fontSize: 21.sp,
                                  fontWeight: Styles.boldText,
                                  color: Styles.primaryColor),
                            ),
                            Image.asset(
                              AppIcons.back,
                              width: 25.h,
                              height: 25.h,
                              fit: BoxFit.contain,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                        DefaultSizedBox.vertical(20),
                        NearestGames(
                          icon: AppIcons.atheletics,
                          sport: 'Athletics',
                          events: ['Men’s 400m Hurdles Round 1'],
                          startTime: '02:30 PM',
                          endTime: '05:30 PM',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            expandableContent: Container(
              constraints:
                  BoxConstraints(maxHeight: Globals().getScreenHeight() * 0.5),
              color: Styles.whiteColor,
              child: DefaultPadding(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    DefaultDivider(),
                    DefaultSizedBox.vertical(35),
                    NearestGames(
                      icon: AppIcons.aquatics,
                      sport: 'Aquatics',
                      events: [
                        'Women’s 50m breaststroke',
                        'Women’s 100m breaststroke',
                        'Women’s 200m breaststroke'
                      ],
                      startTime: '03:30 PM',
                      endTime: '05:30 PM',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NearestGames extends StatelessWidget {
  final String icon;
  final String sport;
  final List<String>? events;
  final String startTime;
  final String endTime;

  NearestGames(
      {this.icon = '',
      this.sport = '',
      List<String>? events,
      this.startTime = '',
      this.endTime = ''})
      : events = events == null ? [] : events;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SportIconContainer(
          icon: icon,
        ),
        DefaultSizedBox.horizontal(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sport.toUpperCase(),
              style: TextStyle(
                color: Styles.primaryColor,
                fontSize: Styles.titleFontSize,
                fontWeight: Styles.boldText,
              ),
            ),
            DefaultSizedBox.vertical(5),
            for (String event in events!)
              Text(
                event.toUpperCase(),
                style: TextStyle(
                  color: Styles.primaryDarkColor,
                  fontSize: Styles.regularFontSize,
                ),
              ),
            DefaultSizedBox.vertical(25),
            Text(
              'My Dinh National Stadium',
              style: TextStyle(
                  color: Styles.primaryDarkColor,
                  fontWeight: Styles.boldText,
                  fontSize: Styles.regularFontSize),
            ),
            DefaultSizedBox.vertical(5),
            Text(
              '$startTime - $endTime',
              style: TextStyle(
                  color: Styles.primaryColor, fontSize: Styles.regularFontSize),
            ),
          ],
        ),
      ],
    );
  }
}
