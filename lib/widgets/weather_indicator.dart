import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import './default_sized_box.dart';

class WeatherIndicator extends StatelessWidget {
  final double iconSize;
  final double? fontSize;

  WeatherIndicator({
    this.iconSize = 24,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.light_mode_outlined,
          size: iconSize.h,
          color: Styles.whiteColor,
        ),
        DefaultSizedBox.vertical(5),
        Text(
          '30º / 25º',
          style: TextStyle(
              fontSize: fontSize ?? Styles.smallerRegularSize,
              color: Styles.whiteColor),
        ),
      ],
    );
  }
}