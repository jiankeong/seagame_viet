import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_games_gms/widgets/default_sized_box.dart';

import '../app_strings.dart';
import '../icon_image_path.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/default_button.dart';
import '../styles.dart';
import '../widgets/default_padding.dart';
import '../widgets/country_flag_container.dart';
import '../widgets/oval_button.dart';
import '../utils/build_dialog.dart';
import '../widgets/medal_tally/medal_tally_widgets.dart';

class MedalTallyScreen extends StatefulWidget {
  static const routeName = '/MedalTally';

  @override
  _MedalTallyScreenState createState() => _MedalTallyScreenState();
}

class _MedalTallyScreenState extends State<MedalTallyScreen> {
  final List<Map<String, dynamic>> _countryMedalList = [
    {
      "country_flag": AppImages.brunei,
      "country_code": "BRU",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.cambodia,
      "country_code": "CAM",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.indonesia,
      "country_code": "INA",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.laos,
      "country_code": "LAO",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.malaysia,
      "country_code": "MAS",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.myanmar,
      "country_code": "MYA",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.philippines,
      "country_code": "PHI",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.singapore,
      "country_code": "SGP",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.thailand,
      "country_code": "THA",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.timorLeste,
      "country_code": "TLS",
      "medal": [0, 0, 0],
      "total": 0,
    },
    {
      "country_flag": AppImages.vietnam,
      "country_code": "VIE",
      "medal": [0, 0, 0],
      "total": 0,
    },
  ];

  int _currentState = 0;
  Map<String, dynamic>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
              title: AppStrings.medalTally.tr(),
              titleLeftPadding: _currentState != 0 ? 55.w : 0,
              trailing: _currentState == 0
                  ? null
                  : OvalButton(
                      horizontalPadding: 8.w,
                      fontSize: Styles.smallerRegularSize,
                      color: Styles.whiteColor,
                      fontColor: Styles.primaryColor,
                      buttonText: AppStrings.selectCountry.tr(),
                      onPressed: onSelectCountryButtonPressed,
                    )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.medalTallyBanner,
                ),
              ),
            ),
            child: DefaultPadding(
              right: 20.w,
              child: Column(
                children: [
                  _currentState == 0
                      ? _buildSelectCountrySection()
                      : _buildCountrySection(),
                  DefaultSizedBox.vertical(20),
                  buildTableTitle(),
                ],
              ),
            ),
          ),
          Expanded(
            child: _buildCountryMedalList(),
          )
        ],
      ),
    );
  }

  Widget _buildSelectCountrySection() {
    return Column(
      children: [
        DefaultButton(
          width: 213.w,
          buttonText: AppStrings.selectCountry,
          color: Styles.whiteColor,
          fontColor: Styles.primaryColor,
          onPressed: onSelectCountryButtonPressed,
        ),
        DefaultSizedBox.vertical(8),
        Text(
          AppStrings.selectCountryInfoText.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Styles.whiteColor,
            fontSize: Styles.smallerRegularSize,
          ),
        ),
      ],
    );
  }

  Widget _buildCountrySection() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryFlagContainer(
                countryFlag: selectedCountry!['flag'],
                width: 57.w,
                height: 37.h,
              ),
              DefaultSizedBox.vertical(5),
              Text(
                selectedCountry!['name'].toString().tr(),
                style: TextStyle(
                  color: Styles.whiteColor,
                  fontSize: Styles.regularFontSize,
                  fontWeight: Styles.boldText,
                ),
              ),
              DefaultSizedBox.vertical(5),
              Text(
                '# 0',
                style: TextStyle(
                  color: Styles.whiteColor,
                  fontSize: Styles.smallerRegularSize,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Row(
            children: [
              MedalWithScore(
                medal: AppImages.goldMedal,
              ),
              DefaultSizedBox.horizontal(5),
              MedalWithScore(
                medal: AppImages.silverMedal,
              ),
              DefaultSizedBox.horizontal(5),
              MedalWithScore(
                medal: AppImages.bronzeMedal,
              ),
              DefaultSizedBox.horizontal(15),
              Text(
                '0',
                style: TextStyle(
                  color: Styles.whiteColor,
                  fontSize: Styles.smallerTitleFontSize,
                  fontWeight: Styles.boldText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onSelectCountryButtonPressed() async {
    final res = await buildSelectCountryDialog(context);

    if (res == null) return;

    setState(() {
      _currentState = 1;
      selectedCountry = res;
    });
  }

  Widget buildTableTitle() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: MedalTallyTableTitle(
            title: AppStrings.country,
          ),
        ),
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MedalTallyTableTitle(
                  title: AppStrings.gold,
                  alignCenter: true,
                ),
              ),
              Expanded(
                child: MedalTallyTableTitle(
                  title: AppStrings.silver,
                  alignCenter: true,
                ),
              ),
              Expanded(
                child: MedalTallyTableTitle(
                  title: AppStrings.bronze,
                  alignCenter: true,
                ),
              ),
              Expanded(
                child: MedalTallyTableTitle(
                  title: AppStrings.total,
                  alignCenter: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCountryMedalList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      itemBuilder: (context, index) {
        Map<String, dynamic> countryMedal = _countryMedalList[index];

        return DefaultPadding(
          top: 10,
          bottom: 10,
          right: 20.w,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    CountryFlagContainer(
                      width: 29.w,
                      height: 19.h,
                      hasShadow: true,
                      countryFlag: countryMedal['country_flag'],
                    ),
                    DefaultSizedBox.horizontal(5),
                    Text(
                      countryMedal['country_code'],
                      style: TextStyle(
                        fontSize: Styles.regularFontSize,
                        fontWeight: Styles.boldText,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int score in countryMedal['medal'])
                      Expanded(
                        child: Text(
                          score.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Styles.primaryDarkColor,
                            fontSize: Styles.regularFontSize,
                            fontWeight: Styles.boldText,
                          ),
                        ),
                      ),
                    Expanded(
                      child: Text(
                        countryMedal['total'].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Styles.primaryColor,
                          fontSize: Styles.regularFontSize,
                          fontWeight: Styles.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: _countryMedalList.length,
    );
  }
}
