import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static const Color primaryColor = Color(0xFF7E38BB);
  static const Color primaryDarkColor = Color(0xFF330672);

  static const FontWeight lightText = FontWeight.w300;
  static const FontWeight regularText = FontWeight.normal;
  static const FontWeight boldText = FontWeight.w700;

  static double fontSize10 = 10.sp;
  static double smallerRegularSize = 12.sp;
  static double regularFontSize = 14.sp;
  static double smallerTitleFontSize = 16.sp;
  static double titleFontSize = 18.sp;

  static const Color grey65 = Color(0xFFA6A6A6);
  static const Color sonicSilver = Color(0xFF767676);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static Color redColor = Colors.red[700]!;

  static const Color dividerColor = Color(0xFFB5B1B8);

  static TextStyle errorHintTextStyle = TextStyle(
    fontSize: Styles.regularFontSize,
    color: Styles.grey65,
  );

  static BorderRadius defaultBorderRadius = BorderRadius.circular(
    25.h,
  );
}
