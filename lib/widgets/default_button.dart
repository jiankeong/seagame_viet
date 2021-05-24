import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../styles.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final double? width;
  final double? height;
  final double verticalPadding;
  final double horizontalPadding;
  final Color? color;
  final Color? fontColor;
  final Function()? onPressed;
  final double? fontSize;

  DefaultButton({
    this.buttonText = '',
    this.width,
    this.height,
    this.verticalPadding = 13,
    this.horizontalPadding = 15,
    this.color = Styles.primaryColor,
    this.fontColor = Styles.whiteColor,
    this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding.h,
          horizontal: horizontalPadding.w,
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.3,
                color: Styles.blackColor.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(2, 2),
              )
            ]),
        child: Text(
          buttonText.tr().toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: Styles.boldText,
            fontSize: fontSize ?? Styles.titleFontSize,
            color: fontColor ?? Styles.whiteColor,
          ),
        ),
      ),
    );
  }
}
