import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class CustomShadowContainer extends StatelessWidget {
  final Widget? child;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final Color backgroundColor;
  final bool roundedCorner;
  final String? backgroundImage;
  final List<BoxShadow>? shadow;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  CustomShadowContainer({
    this.child,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.backgroundColor = Styles.whiteColor,
    this.roundedCorner = true,
    this.backgroundImage,
    this.shadow,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        leftPadding.w,
        topPadding.h,
        rightPadding.w,
        bottomPadding.h,
      ),
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: backgroundImage != null
            ? DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  backgroundImage!,
                ),
              )
            : null,
        color: backgroundColor,
        borderRadius: borderRadius != null
            ? borderRadius
            : roundedCorner
                ? Styles.defaultBorderRadius
                : null,
        boxShadow: shadow ??
            [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                offset: Offset(1, 1.8),
              ),
            ],
      ),
      child: child ?? Container(),
    );
  }
}
