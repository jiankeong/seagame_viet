import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';

class DefaultPadding extends StatelessWidget {
  final ScreenUtil su = ScreenUtil();
  final Widget? child;
  final double top;
  final double bottom;
  final double left;
  final double right;

  DefaultPadding({
    this.child,
    this.top = 0,
    this.bottom = 0,
    this.left = kDefaultScreenHorizontalPadding,
    this.right = kDefaultScreenHorizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left.w,
        top.h,
        right.w,
        bottom.h,
      ),
      child: child ?? Container(),
    );
  }
}
