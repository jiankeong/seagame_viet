import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_sport_grid.dart';

class GamesScreen extends StatelessWidget {
  static const routeName = '/Games';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.games.tr(),
          ),
          Expanded(
            child: DefaultSportGrid(),
          )
        ],
      ),
    );
  }
}
