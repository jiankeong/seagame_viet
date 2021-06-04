import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';
import '../country_flag_container.dart';
import '../default_sized_box.dart';
import '../default_divider.dart';
import '../../app_strings.dart';
import '../../icon_image_path.dart';

class TimingResultContainer extends StatelessWidget {
  final List<Map<String, dynamic>> _results = [
    {
      "country_flag": AppImages.singapore,
      "country_code": "SGP",
      "player_name": "J.Tan",
      "special_records": "SR",
      "timing": "15:12:123",
    },
    {
      "country_flag": AppImages.singapore,
      "country_code": "SGP",
      "player_name": "J.Schooling",
      "timing": "15:13:103",
    },
    {
      "country_flag": AppImages.malaysia,
      "country_code": "MAS",
      "player_name": "W.SIM",
      "timing": "18:01:003",
    },
    {
      "country_flag": AppImages.vietnam,
      "country_code": "VIE",
      "player_name": "H.H. Nguyen",
      "timing": "19:01:103",
    },
    {
      "country_flag": AppImages.indonesia,
      "country_code": "INE",
      "player_name": "I.G.S. Sudartawa",
      "timing": "19:02:111",
    },
    {
      "country_flag": AppImages.philippines,
      "country_code": "PHI",
      "player_name": "J.Deiparine",
      "timing": "19:03:113",
    },
    {
      "country_flag": AppImages.thailand,
      "country_code": "THA",
      "player_name": "K. Nuttapong",
      "timing": "19:03:122",
    },
    {
      "country_flag": AppImages.vietnam,
      "country_code": "VIE",
      "player_name": "T.H. Nguyen",
      "timing": "19:11:003",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                AppStrings.no.tr(),
                style: Styles.resultTableLabelTextStyle,
              ),
            ),
            DefaultSizedBox.horizontal(5),
            Expanded(
              flex: 6,
              child: Text(
                AppStrings.name.tr(),
                style: Styles.resultTableLabelTextStyle,
              ),
            ),
            DefaultSizedBox.horizontal(5),
            Expanded(
              flex: 3,
              child: Text(
                AppStrings.time.tr(),
                textAlign: TextAlign.end,
                style: Styles.resultTableLabelTextStyle,
              ),
            ),
          ],
        ),
        DefaultSizedBox.vertical(8),
        DefaultDivider(
          color: Styles.blackColor,
        ),
        DefaultSizedBox.vertical(12),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            Map<String, dynamic> result = _results[index];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: TimingResultRow(
                countryFlag: result['country_flag'],
                countryCode: result['country_code'],
                playerName: result['player_name'],
                index: index,
                timing: result['timing'],
                specialRecords: result['special_records'],
              ),
            );
          },
          itemCount: _results.length,
        ),
        DefaultSizedBox.vertical(12),
        DefaultDivider(
          color: Styles.suvaGrey.withOpacity(0.2),
        ),
      ],
    );
  }
}

class TimingResultRow extends StatelessWidget {
  final String countryFlag;
  final String countryCode;
  final String playerName;
  final int index;
  final String timing;
  final String? specialRecords;

  TimingResultRow({
    this.countryFlag = AppImages.vietnam,
    this.countryCode = "VIE",
    this.playerName = "",
    this.index = 0,
    this.timing = "",
    this.specialRecords,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    CountryFlagContainer(
                      countryFlag: countryFlag,
                      width: 18,
                      height: 12,
                      hasShadow: true,
                    ),
                    DefaultSizedBox.horizontal(5),
                    Text(
                      countryCode,
                      style: TextStyle(
                        fontSize: Styles.regularFontSize,
                        color: Styles.primaryDarkColor,
                        fontWeight: Styles.boldText,
                      ),
                    ),
                  ],
                ),
              ),
              DefaultSizedBox.horizontal(15),
              Expanded(
                flex: 2,
                child: Text(
                  playerName,
                  style: TextStyle(
                    fontSize: Styles.regularFontSize,
                    color: Styles.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (specialRecords != null)
                Text(
                  specialRecords!,
                  style: TextStyle(
                    fontSize: Styles.regularFontSize,
                    color: Styles.primaryDarkColor,
                    fontWeight: Styles.boldText,
                  ),
                ),
              DefaultSizedBox.horizontal(3),
              medalMapper(),
              DefaultSizedBox.horizontal(3),
              Flexible(
                child: Text(
                  timing,
                  style: TextStyle(
                    fontSize: Styles.regularFontSize,
                    color: Styles.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget medalMapper() {
    String? medal;

    if (index == 0)
      medal = AppImages.goldMedal;
    else if (index == 1)
      medal = AppImages.silverMedal;
    else if (index == 2) medal = AppImages.bronzeMedal;

    if (medal != null) {
      return Image.asset(
        medal,
        width: 15.h,
        height: 15.h,
      );
    } else {
      return Container();
    }
  }
}
