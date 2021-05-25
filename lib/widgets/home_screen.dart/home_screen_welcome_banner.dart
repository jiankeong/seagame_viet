import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';
import '../../icon_image_path.dart';

class HomeScreenWelcomeBanner extends StatelessWidget {
  const HomeScreenWelcomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.3,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                  color: Styles.blackColor.withOpacity(0.1),
                ),
              ],
              borderRadius: BorderRadius.circular(15.h),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.h),
              child: Image.asset(
                AppImages.seagame2021Banner,
                width: 267.w,
                height: 116.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          right: -40.0,
          top: 20,
          child: Image.asset(
            AppImages.mascot,
            width: 108.w,
            height: 125.h,
          ),
        )
      ],
    );
  }
}