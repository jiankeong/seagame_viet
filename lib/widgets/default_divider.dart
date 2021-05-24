import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class DefaultDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color? color;
  final bool isVertical;

  const DefaultDivider({
    this.height = 1.0,
    this.thickness = 1.5,
    this.color,
  }) : isVertical = false;

  const DefaultDivider.vertical({
    this.height = 1.0,
    this.thickness = 1.5,
    this.color,
  }) : isVertical = true;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? VerticalDivider(
            thickness: thickness.w,
            color: color ?? Styles.primaryDarkColor,
          )
        : Divider(
            height: height,
            thickness: thickness.h,
            color: color ?? Styles.dividerColor,
          );
  }
}
