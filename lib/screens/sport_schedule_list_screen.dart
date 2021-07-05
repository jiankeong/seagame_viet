import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/custom_shadow_container.dart';
import '../widgets/weather_indicator.dart';
import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../utils/date_format_utils.dart';
import '../widgets/default_padding.dart';
import './sport_schedule_detail_screen.dart';

class SportScheduleListScreen extends StatefulWidget {
  static const routeName = '/SportScheduleList';

  @override
  _SportScheduleListScreenState createState() =>
      _SportScheduleListScreenState();
}

class _SportScheduleListScreenState extends State<SportScheduleListScreen> {
  String chosenSport = AppStrings.paraSwimming;

  bool isInit = true;

  List<SportSchedule> _sportSchedules = [
    SportSchedule.fromJson({
      "id": 1,
      "start_time": "2021-12-01 09:00:00",
      "end_time": "2021-12-01 12:30:00",
      "location": "ISA SPORTS CITY",
      "is_night": false,
      "min_temp": 27,
      "max_temp": 29,
      "events": [
        'Women’s Backstroke 400m Final',
        // 'Men’s High Jump Qualifying Round',
        // 'Men’s Discus Throw Qualifying Round',
        // 'Women’s 800m Round 1',
        // 'Men’s 400m Hurdles Round 1',
        // 'Women’s 100m Round 1',
      ]
    }),
  ];

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
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                SportSchedule sportSchedule = _sportSchedules[index];

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SportScheduleDetailScreen.routeName,
                        );
                      },
                      child: CustomShadowContainer(
                        topPadding: 25,
                        bottomPadding: 25,
                        roundedCorner: false,
                        child: DefaultPadding(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormatUtils
                                              .combineStartDateAndEndDate(
                                            sportSchedule.startTime!,
                                            sportSchedule.endTime!,
                                          ),
                                          style: TextStyle(
                                              fontSize:
                                                  Styles.smallerTitleFontSize,
                                              fontWeight: Styles.boldText,
                                              color: Styles.primaryDarkColor),
                                        ),
                                        DefaultSizedBox.vertical(5),
                                        Row(
                                          children: [
                                            Text(
                                              sportSchedule.location!,
                                              style: TextStyle(
                                                  fontSize: Styles
                                                      .smallerTitleFontSize,
                                                  fontWeight: Styles.boldText,
                                                  color:
                                                      Styles.primaryDarkColor),
                                            ),
                                            DefaultSizedBox.horizontal(5),
                                            Icon(
                                              Icons.place,
                                              size: 12.h,
                                              color: Styles.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    DefaultSizedBox.horizontal(10),
                                    WeatherIndicator(
                                      isNight: sportSchedule.isNight!,
                                      value:
                                          '${sportSchedule.minTemp}º / ${sportSchedule.maxTemp}º',
                                      fontColor: Styles.primaryDarkColor,
                                      iconColor: Styles.primaryColor,
                                      fontSize: Styles.regularFontSize,
                                      iconSize: 24.h,
                                    ),
                                  ]),
                              DefaultSizedBox.vertical(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (String event in sportSchedule.events!)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '\u2022 $event',
                                          style: TextStyle(
                                            fontSize: Styles.regularFontSize,
                                            color: Styles.primaryColor,
                                          ),
                                        ),
                                        DefaultSizedBox.vertical(5),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (index < _sportSchedules.length - 1)
                      DefaultSizedBox.vertical(15),
                  ],
                );
              },
              itemCount: _sportSchedules.length,
            ),
          ),
        ],
      ),
    );
  }
}

class SportSchedule {
  int? id;
  DateTime? startTime;
  DateTime? endTime;
  String? location;
  bool? isNight;
  int? minTemp;
  int? maxTemp;
  List<String>? events;

  SportSchedule({
    this.id,
    this.startTime,
    this.endTime,
    this.location,
    this.isNight,
    this.events,
    this.minTemp,
    this.maxTemp,
  });

  factory SportSchedule.fromJson(Map<String, dynamic> json) => SportSchedule(
        id: json['id'] ?? null,
        startTime: json['start_time'] == null
            ? null
            : DateTime.parse('2021-12-01 09:00:00'),
        endTime: json['end_time'] == null
            ? null
            : DateTime.parse('2021-12-01 12:30:00'),
        location: json['location'] ?? null,
        isNight: json['is_night'] ?? null,
        minTemp: json['min_temp'] ?? null,
        maxTemp: json['max_temp'] ?? null,
        events: json['events'] ?? null,
      );
}
