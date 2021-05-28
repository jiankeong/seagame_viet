import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/search_container_with_banner.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/country_name_flag_container.dart';
import '../app_strings.dart';
import '../widgets/filter_button.dart';
import '../icon_image_path.dart';
import '../widgets/athlete/athlete_list.dart';
import '../utils/build_bottom_sheet.dart';
import '../widgets/filter_bottom_sheet_layout.dart';

class CountryAthleteListScreen extends StatefulWidget {
  static const routeName = '/CountryAthleteList';

  @override
  _CountryAthleteListScreenState createState() =>
      _CountryAthleteListScreenState();
}

class _CountryAthleteListScreenState extends State<CountryAthleteListScreen> {
  bool isInit = true;
  Map<String, dynamic>? country;

  final List<Map<String, dynamic>> _athletesList = [
    {
      "starting_character": "L",
      "athletes": [
        {
          "name": "Lee Chong Wei",
          "sport": "Badminton",
          "event": ['Singles'],
          "medals": [AppImages.goldMedal],
        },
        {
          "name": "Loh Choon How",
          "sport": "Wushu",
          "event": ['Men’s taijijian'],
          "medals": [AppImages.goldMedal],
        },
      ]
    },
    {
      "starting_character": "P",
      "athletes": [
        {
          "name": "Phee Jinq En",
          "sport": "Swimming",
          "event": [
            'Women’s 50m breaststroke',
            'Women’s 100m breaststroke',
            'Women’s 200m breaststroke'
          ],
          "medals": [
            AppImages.goldMedal,
            AppImages.bronzeMedal,
          ],
        },
      ]
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Column(children: [
          DefaultAppBar(
            title: AppStrings.athletes.tr(),
            trailing: _buildFilterButton(),
          ),
          SearchContainerWithBanner(
            hintText: AppStrings.searchAthlete,
          ),
          CountryNameFlagContainer(
            countryFlag: country!['flag'],
            countryName: country!['name'],
          ),
          Expanded(
            child: AthleteList(
              athletesList: _athletesList,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildFilterButton() {
    return FilterButton(
      onPressed: () async {
        final res = await buildBottomSheet(
          context,
          FilterBottomSheetLayout(),
          heightScale: 0.45,
        );

        if (res == null || (res['sport'] == null && res['discipline'] == null))
          return;
      },
    );
  }
}
