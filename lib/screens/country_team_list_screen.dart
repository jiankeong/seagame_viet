import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_app_bar.dart';
import '../widgets/search_container_with_banner.dart';
import '../app_strings.dart';
import '../widgets/default_sport_grid.dart';
import '../icon_image_path.dart';
import './country_team_sport_screen.dart';
import '../widgets/country_name_flag_container.dart';

class CountryTeamListScreen extends StatefulWidget {
  static const routeName = '/CountryTeamList';

  @override
  _CountryTeamListScreenState createState() => _CountryTeamListScreenState();
}

class _CountryTeamListScreenState extends State<CountryTeamListScreen> {
  bool isInit = true;

  Map<String, dynamic>? country;

  List<Map<String, dynamic>> sportList = [
    {
      "name": AppStrings.archery,
      "icon": AppIcons.archery,
    },
    {
      "name": AppStrings.aquatics,
      "icon": AppIcons.aquatics,
    },
    {
      "name": AppStrings.basketball,
      "icon": AppIcons.basketball,
    },
    {
      "name": AppStrings.football,
      "icon": AppIcons.football,
    },
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      if (args != null && args['country'] != null) {
        country = args['country'];
      }
    }

    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.teams.tr(),
          ),
          SearchContainerWithBanner(),
          CountryNameFlagContainer(
            countryFlag: country!['flag'],
            countryName: country!['name'],
          ),
          Expanded(
            child: DefaultSportGrid(
              sportList: sportList,
              moveToScreenRouteName: CountryTeamSportScreen.routeName,
              country: country,
            ),
          ),
        ],
      ),
    );
  }
}
