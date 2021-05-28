import 'package:flutter/material.dart';

import '../../icon_image_path.dart';
import './athlete_list.dart';

class MyAthleteListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _athletesList = [
    {
      "starting_character": "L",
      "athletes": [
        {
          "name": "Lee Chong Wei",
          "sport": "Badminton",
          "event": ['Singles'],
          "medals": [AppImages.goldMedal],
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AthleteList(
      athletesList: _athletesList,
    );
  }
}
