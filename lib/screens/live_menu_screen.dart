import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/search_container.dart';
import '../constants/app_constants.dart';
import '../models/game_match.dart';
import '../widgets/match_container.dart';
import '../widgets/default_sized_box.dart';
import './live_details_screen.dart';

class LiveMenuScreen extends StatelessWidget {
  static const routeName = '/LiveMenu';

  final List<GameMatch> matches = [
    GameMatch(
        title: 'WOMEN’S SINGLE SEMIFINAL 1',
        type: 'Para Badminton',
        description: 'INA VS MAS',
        location: 'ISA SPORTS CITY',
        startDate: DateTime.parse('2021-12-03 20:00:00'),
        endDate: DateTime.parse('2021-12-03 23:00:00'),
        image:
            'https://cdn.shopify.com/s/files/1/1238/5608/collections/Aya-OHORI.jpg?v=1579605374'),
    GameMatch(
        title: 'MEN’S SINGLE SEMIFINAL 1',
        type: 'Para Badminton',
        description: 'INA VS MAS',
        location: 'ISA SPORTS CITY',
        startDate: DateTime.parse('2021-12-03 20:00:00'),
        endDate: DateTime.parse('2021-12-03 23:00:00'),
        image:
            'https://apicms.thestar.com.my/uploads/images/2020/12/12/970711.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.live.tr(),
          ),
          SearchContainer(
            borderRadius: 0,
            leftPadding: kDefaultScreenHorizontalPadding,
            hintText: AppStrings.search.tr(),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              GameMatch match = matches[index];

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        LiveDetailsScreen.routeName,
                      );
                    },
                    child: MatchContainer(
                      match: match,
                    ),
                  ),
                  DefaultSizedBox.vertical(15),
                ],
              );
            },
            itemCount: matches.length,
          )),
        ],
      ),
    );
  }
}
