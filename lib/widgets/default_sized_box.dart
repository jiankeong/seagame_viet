import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultSizedBox extends StatelessWidget {
  final ScreenUtil su = ScreenUtil();
  final double verticalSpacing;
  final double horizontalSpacing;
  final bool? isVertical;
  final bool isAlign;
  final Widget? child;

  DefaultSizedBox(
      {this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.child,
      this.isAlign = false})
      : isVertical = null;

  DefaultSizedBox.vertical(double spacing)
      : isVertical = true,
        verticalSpacing = spacing,
        horizontalSpacing = 0,
        child = null,
        isAlign = false;

  DefaultSizedBox.horizontal(double spacing)
      : isVertical = false,
        verticalSpacing = 0,
        horizontalSpacing = spacing,
        child = null,
        isAlign = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVertical == null || isVertical == true
          ? verticalSpacing.h
          : 0,
      width: isVertical == null || isVertical == false
          ? isAlign
              ? horizontalSpacing.h
              : horizontalSpacing.w
          : 0,
      child: child == null ? Container() : child,
    );
  }
}
