import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../default_sized_box.dart';
import '../../styles.dart';
import '../result_containers/result_containers.dart';
import '../../app_strings.dart';
import '../../globals.dart';
import '../../icon_image_path.dart';

class CompetitionResultDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Globals().getScreenWidth() * 0.05),
          child: Container(
            decoration: BoxDecoration(
              color: Styles.whiteColor,
              borderRadius: BorderRadius.circular(10.h),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 25.h,
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppIcons.cancel,
                        width: 25.h,
                        height: 25.h,
                        fit: BoxFit.contain,
                        color: Colors.transparent,
                      ),
                      Text(
                        AppStrings.results.tr(),
                        style: TextStyle(
                          color: Styles.primaryColor,
                          fontSize: 21.sp,
                          fontWeight: Styles.boldText,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppIcons.cancel,
                          width: 25.h,
                          height: 25.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  DefaultSizedBox.vertical(35),
                  ScoreResultContainer(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
