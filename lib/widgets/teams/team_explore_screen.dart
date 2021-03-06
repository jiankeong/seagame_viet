import 'package:flutter/material.dart';

import '../search_container_with_banner.dart';
import '../country_list.dart';
import '../../screens/country_team_list_screen.dart';

class TeamExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        children: [
          SearchContainerWithBanner(),
          Expanded(
            child: CountryList(
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
          ),
        ],
      ),
    );
  }
}
