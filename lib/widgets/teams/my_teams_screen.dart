import 'package:flutter/material.dart';

import '../default_sport_grid.dart';
import '../../icon_image_path.dart';
import '../../app_strings.dart';
import '../../screens/country_team_sport_screen.dart';

class MyTeamsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> sportList = [
    {
      "name": AppStrings.basketball,
      "icon": AppIcons.basketball,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultSportGrid(
      sportList: sportList,
      moveToScreenRouteName: CountryTeamSportScreen.routeName,
      country: {
        "id": 5,
        "flag": AppImages.malaysia,
        "name": AppStrings.malaysia,
      },
    );
  }
}
