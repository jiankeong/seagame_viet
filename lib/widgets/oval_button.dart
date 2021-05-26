import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class OvalButton extends StatelessWidget {
  final String? buttonText;
  final double? height;
  final double? width;
  final Color? color;
  final double? fontSize;
  final double verticalPadding;
  final double horizontalPadding;
  final Color? fontColor;

  OvalButton({
    this.buttonText = '',
    this.height,
    this.width,
    this.color,
    this.fontSize,
    this.verticalPadding = 8,
    this.horizontalPadding = 15,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding.w, horizontal: horizontalPadding.h),
      decoration: BoxDecoration(
          color: color ?? Styles.primaryColor,
          borderRadius: BorderRadius.circular(25.h)),
      child: Text(
        buttonText!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor ?? Styles.whiteColor,
          fontSize: fontSize ?? Styles.regularFontSize,
        ),
      ),
    );
  }
}
