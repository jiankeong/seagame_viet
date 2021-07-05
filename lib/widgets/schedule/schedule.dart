import 'package:flutter/material.dart';

import 'schedule_table.dart';
import 'schedule_side_bar.dart';

class Schedule extends StatelessWidget {
  final Map<String, dynamic> _schedules = {
    "start_date": "2021-11-28 00:00:00",
    "end_date": "2021-12-07 00:00:00",
    "schedules": [
      {
        "sport": "Opening and Closing Ceremonies",
      },
      {
        "sport": "Boccia",
      },
      {
        "sport": "Para Powerlifting",
      },
      {
        "sport": "Para Swimming",
      },
      {
        "sport": "Wheelchair Basketball",
      },
      {
        "sport": "Para Athletics Goalball",
      },
      {
        "sport": "Taekwondo",
      },
      {
        "sport": "Para badminton",
      },
      {
        "sport": "Para Table Tennis",
      },
      // {
      //   "sport": "Archery",
      // },
      // {
      //   "sport": "Athletics",
      // },
      // {
      //   "sport": "Aquatics",
      // },
      // {
      //   "sport": "Badminton",
      // },
      // {
      //   "sport": "Basketball",
      // },
      // {
      //   "sport": "Billiards & Snooker",
      // },
      // {
      //   "sport": "Beach Volleyball",
      // },
      // {
      //   "sport": "Bodybuilding",
      // },
      // {
      //   "sport": "Boxing",
      // },
      // {
      //   "sport": "Canoe Kayak",
      // },
      // {
      //   "sport": "Chess",
      // },
      // {
      //   "sport": "Chess (Xiangqi)",
      // },
      // {
      //   "sport": "Dancesport",
      // },
      // {
      //   "sport": "Diving",
      // },
      // {
      //   "sport": "E-sports",
      // },
      // {
      //   "sport": "Fencing",
      // },
      // {
      //   "sport": "Finswimming",
      // },
      // {
      //   "sport": "Football",
      // },
      // {
      //   "sport": "Golf",
      // },
      // {
      //   "sport": "Gymnastics",
      // },
      // {
      //   "sport": "Handball",
      // },
      // {
      //   "sport": "Karate",
      // },
      // {
      //   "sport": "Kickboxing",
      // },
      // {
      //   "sport": "Muay",
      // },
      // {
      //   "sport": "Pencak Silat",
      // },
      // {
      //   "sport": "Pétanque",
      // },
      // {
      //   "sport": "Sepak Takraw",
      // },
      // {
      //   "sport": "Shooting",
      // },
      // {
      //   "sport": "Shuttlecock",
      // },
      // {
      //   "sport": "Table Tennis",
      // },
      // {
      //   "sport": "Taekwondo",
      // },
      // {
      //   "sport": "Tennis",
      // },
      // {
      //   "sport": "Vovinam",
      // },
      // {
      //   "sport": "Weightlifting",
      // },
      // {
      //   "sport": "Wrestling",
      // },
      // {
      //   "sport": "Wushu",
      // }
    ],
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          ScheduleTable(
            startDate: DateTime.parse(_schedules['start_date']),
            endDate: DateTime.parse(_schedules['end_date']),
            sports: List<Map<String, dynamic>>.from(
              _schedules['schedules'],
            ),
          ),
          ScheduleSideBar(
            sports: List<Map<String, dynamic>>.from(
              _schedules['schedules'],
            ),
          ),
        ],
      ),
    );
  }
}
