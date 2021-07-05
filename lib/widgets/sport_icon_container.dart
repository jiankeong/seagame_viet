import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class SportIconContainer extends StatelessWidget {
  final String? icon;
  final double size;

  SportIconContainer({
    this.icon,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: Image.asset(
        icon!,
        width: size.h,
        height: size.h,
        color: Styles.whiteColor,
      ),
    );
  }
}