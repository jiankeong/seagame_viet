import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/header_profile_container.dart';
import '../globals.dart';
import '../styles.dart';
import '../app_strings.dart';
import '../icon_image_path.dart';
import '../widgets/default_padding.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/competition/competition_widgets.dart';
import '../widgets/text_between_lines.dart';
import '../utils/build_dialog.dart';

class CompetitionScreen extends StatelessWidget {
  static const routeName = '/Competition';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.competitionBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15.h),
              width: double.infinity,
              height: Globals().getScreenHeight() * 0.35,
              color: Styles.primaryColor,
              child: Column(
                children: [
                  Expanded(child: HeaderProfileContainer()),
                  DefaultSizedBox.vertical(15),
                  _buildTitle(context),
                ],
              ),
            ),
            Expanded(
              child: DefaultPadding(
                child: Column(
                  children: [
                    DefaultSizedBox.vertical(25),
                    CompetitionContainer(),
                    DefaultSizedBox.vertical(45),
                    TextBetweenLines(
                      labelText: AppStrings.previousMatch.tr().toUpperCase(),
                      boldText: true,
                    ),
                    DefaultSizedBox.vertical(45),
                    CompetitionContainer(
                      isPrevious: true,
                      startTime: DateTime.parse('2021-12-02 18:00:00'),
                      endTime: DateTime.parse('2021-12-02 23:00:00'),
                      sport: 'Badminton',
                      event: 'MEN’S SINGLES QUARTERFINALS',
                      opponentName: 'M.C. Gideon',
                      countryCode: 'INA',
                      countryFlag: AppImages.indonesia,
                      onPressed: () {
                        buildCompetitionResultDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return DefaultPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppIcons.back,
              width: 25.h,
              height: 25.h,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            AppStrings.competition.tr(),
            style: TextStyle(
                color: Styles.whiteColor,
                fontSize: 21.sp,
                fontWeight: Styles.boldText),
          ),
          Image.asset(
            AppIcons.back,
            width: 25.h,
            height: 25.h,
            fit: BoxFit.contain,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
