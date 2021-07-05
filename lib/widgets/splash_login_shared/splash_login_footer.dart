import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';
import '../../app_strings.dart';
import '../default_sized_box.dart';
import '../text_pressable.dart';
import '../../constants/app_constants.dart';
import '../default_divider.dart';

class SplashLoginFooter extends StatelessWidget {
  final Function()? termsOnPressed;
  final Function()? privacyPolicyOnPressed;

  SplashLoginFooter({
    this.termsOnPressed,
    this.privacyPolicyOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.copyright.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Styles.smallerRegularSize,
            color: Styles.primaryDarkColor,
            fontWeight: Styles.boldText,
          ),
        ),
        DefaultSizedBox.vertical(15),
        IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.only(
              // left: 10.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextPressable(
                  label: AppStrings.termsOfUse.tr(),
                  onPressed: termsOnPressed,
                ),
                DefaultSizedBox.horizontal(5),
                DefaultDivider.vertical(),
                DefaultSizedBox.horizontal(5),
                TextPressable(
                  label: AppStrings.privacyStatement.tr(),
                  onPressed: privacyPolicyOnPressed,
                ),
              ],
            ),
          ),
        ),
        DefaultSizedBox.vertical(8),
        Text(
          '${AppStrings.version.tr()} $kAppVersion',
          style: TextStyle(
            fontSize: Styles.smallerRegularSize,
            color: Styles.primaryDarkColor,
            fontWeight: Styles.boldText,
          ),
        ),
        DefaultSizedBox.vertical(20),
      ],
    );
  }
}
