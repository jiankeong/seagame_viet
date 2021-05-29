import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../styles.dart';
import '../icon_image_path.dart';
import '../globals.dart';
import '../widgets/default_padding.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/ceromony/ceromony_widgets.dart';

class OpeningAndClosingCeromoniesScreen extends StatelessWidget {
  static const routeName = '/OpeningAndClosingCeromonies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.openingAndClosingCeromonies.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    AppImages.openingAndClosingCeromonies,
                    width: Globals().getScreenWidth(),
                    height: Globals().getScreenHeight() * 0.32,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    color: Styles.primaryDarkColor,
                    child: DefaultPadding(
                      child: Text(
                        '*${AppStrings.ceromoniesTimeInfo.tr()}',
                        style: TextStyle(
                          fontSize: Styles.smallerTitleFontSize,
                          color: Styles.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  CeromonyContainer(
                    hasPassed: true,
                  ),
                  DefaultSizedBox.vertical(15),
                  CeromonyContainer(
                    startTime: DateTime.parse('2021-12-08 20:00:00'),
                    endTime: DateTime.parse('2021-12-08 23:00:00'),
                    isClosing: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}