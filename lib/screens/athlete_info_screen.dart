import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sea_games_gms/widgets/athlete/athlete_widgets.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_tab.dart';
import '../widgets/default_tab_bar.dart';
import '../styles.dart';
import '../widgets/athlete_info/athlete_info_widgets.dart';

class AthleteInfoScreen extends StatelessWidget {
  static const routeName = '/AthleteInfo';

  final List<Map<String, dynamic>> _tabScreen = [
    {
      "tabTitle": AppStrings.biography.tr(),
      "tabScreen": Biography(),
    },
    {
      "tabTitle": AppStrings.moments.tr(),
      "tabScreen": AthleteMoments(),
    },
    {
      "tabTitle": AppStrings.schedule.tr(),
      "tabScreen": AthleteSchedule(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.athletes.tr(),
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
