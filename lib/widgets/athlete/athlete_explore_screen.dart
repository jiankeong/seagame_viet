import 'package:flutter/material.dart';

import '../search_container_with_banner.dart';
import '../../app_strings.dart';
import '../country_list.dart';
import '../../screens/country_athlete_list_screen.dart';

class AthleteExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        children: [
          SearchContainerWithBanner(
            hintText: AppStrings.searchAthlete,
          ),
          Expanded(
            child: CountryList(
              onPressed: (Map<String, dynamic>? country) {
                Navigator.pushNamed(
                  context,
                  CountryAthleteListScreen.routeName,
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
