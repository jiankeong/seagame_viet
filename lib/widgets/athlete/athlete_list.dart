import 'package:flutter/material.dart';

import './athlete_by_name.dart';

class AthleteList extends StatelessWidget {
  final List<Map<String, dynamic>> _athletesList;

  AthleteList({List<Map<String, dynamic>>? athletesList})
      : _athletesList = athletesList == null ? [] : athletesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        Map<String, dynamic> categories = _athletesList[index];

        List<Map<String, dynamic>> athletes =
            List<Map<String, dynamic>>.from(categories['athletes']);

        return AthleteByName(
          categories: categories,
          athletes: athletes,
        );
      },
      itemCount: _athletesList.length,
    );
  }
}
