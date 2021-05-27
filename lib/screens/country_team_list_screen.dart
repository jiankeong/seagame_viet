import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_games_gms/widgets/default_sized_box.dart';

import '../widgets/default_app_bar.dart';
import '../widgets/teams/team_search_container.dart';
import '../app_strings.dart';
import '../widgets/default_padding.dart';
import '../styles.dart';
import '../widgets/default_sport_grid.dart';
import '../icon_image_path.dart';
import './country_team_sport_screen.dart';

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
          TeamSearchContainer(),
          Container(
            color: Styles.primaryDarkColor,
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: DefaultPadding(
              child: Row(
                children: [
                  Image.asset(
                    country!['flag'],
                    width: 43.w,
                    height: 29.h,
                    fit: BoxFit.contain,
                  ),
                  DefaultSizedBox.horizontal(15),
                  Flexible(
                    child: Text(
                      country!['name'].toString().tr(),
                      style: TextStyle(
                        color: Styles.whiteColor,
                        fontWeight: Styles.boldText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
