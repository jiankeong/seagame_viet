import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../styles.dart';
import '../../app_strings.dart';
import '../default_sized_box.dart';
import '../default_divider.dart';
import '../country_flag_container.dart';
import '../../icon_image_path.dart';

class ScoreResultContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                AppStrings.name.tr(),
                style: Styles.resultTableLabelTextStyle,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.matchSet.tr(),
                      textAlign: TextAlign.center,
                      style: Styles.resultTableLabelTextStyle,
                    ),
                  ),
                  for (int i = 0; i < 5; i++)
                    Expanded(
                      child: Text(
                        '0${i + 1}',
                        textAlign: TextAlign.center,
                        style: Styles.resultTableLabelTextStyle,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        DefaultSizedBox.vertical(8),
        DefaultDivider(
          color: Styles.blackColor,
        ),
        DefaultSizedBox.vertical(12),
        ResultRow(
          countryFlag: AppImages.malaysia,
          countryCode: 'MAS',
          wonSet: 3,
          scores: [21, 21, 19, 21, null],
          playersName: ['C.W. Lee'],
        ),
        DefaultSizedBox.vertical(5),
        ResultRow(
          countryFlag: AppImages.indonesia,
          countryCode: 'INA',
          wonSet: 1,
          scores: [17, 18, 21, 19, null],
          playersName: ['M.C. Gideon'],
        ),
        DefaultSizedBox.vertical(12),
        DefaultDivider(
          color: Styles.suvaGrey.withOpacity(0.2),
        ),
      ],
    );
  }
}

class ResultRow extends StatelessWidget {
  final String? countryFlag;
  final String countryCode;
  final List<String>? playersName;
  final List<int?>? scores;
  final int wonSet;

  ResultRow({
    this.countryFlag,
    this.countryCode = '',
    this.playersName,
    this.scores,
    this.wonSet = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              if (countryFlag != null)
                CountryFlagContainer(
                  countryFlag: countryFlag!,
                  width: 24,
                  height: 15,
                  hasShadow: true,
                ),
              DefaultSizedBox.horizontal(5),
              Text(
                countryCode,
                style: TextStyle(
                  color: Styles.primaryDarkColor,
                  fontSize: Styles.regularFontSize,
                  fontWeight: Styles.boldText,
                ),
              ),
              DefaultSizedBox.horizontal(5),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String player in playersName!)
                      Text(
                        player,
                        style: TextStyle(
                          color: Styles.primaryColor,
                          fontSize: Styles.regularFontSize,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  wonSet.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Styles.smallerRegularSize,
                    color: Styles.primaryDarkColor,
                    fontWeight: Styles.boldText,
                  ),
                ),
              ),
              if (scores != null)
                for (int i = 0; i < 5; i++)
                  Expanded(
                    child: Text(
                      scores![i] == null ? '-' : scores![i]!.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Styles.smallerRegularSize,
                          color: Styles.primaryDarkColor),
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
