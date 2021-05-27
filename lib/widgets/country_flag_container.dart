import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../icon_image_path.dart';
import '../styles.dart';

class CountryFlagContainer extends StatelessWidget {
  final String countryFlag;
  final bool hasShadow;
  final double width;
  final double height;

  const CountryFlagContainer({
    this.countryFlag = AppImages.malaysia,
    this.hasShadow = false,
    this.width = 89,
    this.height = 62,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      margin: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(countryFlag),
        ),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  spreadRadius: 0.1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                  color: Styles.blackColor.withOpacity(0.2),
                ),
              ]
            : null,
      ),
    );
  }
}
