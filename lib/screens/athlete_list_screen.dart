import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_tab.dart';
import '../widgets/default_tab_bar.dart';
import '../styles.dart';
import '../widgets/athlete/athlete_widgets.dart';

class AthleteListScreen extends StatelessWidget {
  static const routeName = '/AthleteList';

  final List<Map<String, dynamic>> _tabScreen = [
    {
      "tabTitle": AppStrings.explore.tr(),
      "tabScreen": AthleteExploreScreen(),
    },
    {
      "tabTitle": AppStrings.myList.tr(),
      "tabScreen": MyAthleteListScreen(),
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
