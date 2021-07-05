import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_strings.dart';
import '../../icon_image_path.dart';
import '../../styles.dart';
import '../default_sized_box.dart';

class SplashLoginLogo extends StatelessWidget {
  final double logoSize;
  final double textFontSize;
  final double leftPadding;
  final double fontLeftPadding;

  SplashLoginLogo({
    this.logoSize = 260,
    this.textFontSize = 34,
    this.leftPadding = 0,
    this.fontLeftPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: leftPadding.w,
            ),
            child: Image.asset(
              AppImages.bahrainLogo,
              width: logoSize.h,
              height: logoSize.h,
              fit: BoxFit.cover,
            ),
          ),
          DefaultSizedBox.vertical(25),
          Padding(
            padding: EdgeInsets.only(
              left: fontLeftPadding.w,
            ),
            child: Text(
              AppStrings.welcome.tr().toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Styles.primaryColor,
                fontSize: textFontSize.sp,
                fontWeight: Styles.boldText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
