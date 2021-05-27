import 'package:flutter/material.dart';

import './team_search_container.dart';
import '../country_list.dart';
import '../../screens/country_team_list_screen.dart';

class TeamExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            TeamSearchContainer(),
            CountryList(
              onPressed: (Map<String, dynamic>? country) {
                Navigator.pushNamed(
                  context,
                  CountryTeamListScreen.routeName,
                  arguments: {
                    "country": country,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
