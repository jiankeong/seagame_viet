import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../icon_image_path.dart';
import '../styles.dart';

class FilterButton extends StatelessWidget {
  final Function()? onPressed;

  FilterButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          color: Styles.primaryDarkColor,
          borderRadius: BorderRadius.circular(5.h),
        ),
        child: Image.asset(
          AppIcons.filter,
          width: 24.w,
          height: 21.h,
        ),
      ),
    );
  }
}