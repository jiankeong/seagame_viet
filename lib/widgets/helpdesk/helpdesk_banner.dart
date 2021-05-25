import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app_strings.dart';
import '../../icon_image_path.dart';
import '../../styles.dart';
import '../default_sized_box.dart';
import '../default_padding.dart';

class HelpdeskBanner extends StatelessWidget {
  const HelpdeskBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppImages.helpdeskBanner,
          ),
        ),
      ),
      child: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.helpdesk.tr(),
              style: TextStyle(
                color: Styles.whiteColor,
                fontSize: Styles.titleFontSize,
                fontWeight: Styles.boldText,
              ),
            ),
            DefaultSizedBox.vertical(10),
            Text(
              AppStrings.contact_us_for_any_further_assistance.tr(),
              style: TextStyle(
                fontSize: Styles.regularFontSize,
                color: Styles.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}