import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../widgets/default_tab.dart';
import '../widgets/default_tab_bar.dart';
import '../styles.dart';
import '../app_strings.dart';
import '../widgets/country_team_sport/country_team_sport_widgets.dart';

class CountryTeamSportScreen extends StatefulWidget {
  static const routeName = '/CountryTeamSport';

  @override
  _CountryTeamSportScreenState createState() => _CountryTeamSportScreenState();
}

class _CountryTeamSportScreenState extends State<CountryTeamSportScreen> {
  bool isInit = true;
  bool isFavourite = false;

  String appBarTitle = '';
  Map<String, dynamic>? country;

  List<Map<String, dynamic>> _tabScreen = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isInit) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      if (args != null) {
        appBarTitle = args['name'] != null ? args['name'] : '';
        country = args['country'] != null ? args['country'] : null;

        _tabScreen = [
          {
            "tabTitle": AppStrings.lineup.tr(),
            "tabScreen": LineupScreen(
              country: country,
            ),
          },
          {
            "tabTitle": AppStrings.news.tr(),
            "tabScreen": CountryTeamSportNews(),
          },
          {
            "tabTitle": AppStrings.schedule.tr(),
            "tabScreen": CountryTeamSportSchedule(),
          },
        ];
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
            title: appBarTitle.tr(),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
              child: Icon(
                Icons.grade,
                size: 26.h,
                color: isFavourite
                    ? Styles.whiteColor
                    : Styles.whiteColor.withOpacity(0.5),
              ),
            ),
          ),
          Expanded(
              child: DefaultTabController(
            length: _tabScreen.length,
            child: Column(
              children: [
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    children: _buildTabScreen(),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return DefaultTabBar(
      tabs: _buildTab(),
      color: Styles.primaryDarkColor,
    );
  }

  List<Widget> _buildTab() {
    List<Widget> _tabs = [];

    for (Map<String, dynamic> screen in _tabScreen) {
      _tabs.add(DefaultTab(
        child: Text(
          screen['tabTitle'].toString().toUpperCase(),
        ),
      ));
    }

    return _tabs;
  }

  List<Widget> _buildTabScreen() {
    List<Widget> _tabScreens = [];

    for (Map<String, dynamic> screen in _tabScreen) {
      _tabScreens.add(screen['tabScreen']);
    }

    return _tabScreens;
  }
}
