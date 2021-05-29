import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import './default_sized_box.dart';

class WeatherIndicator extends StatelessWidget {
  final double iconSize;
  final double? fontSize;
  final bool isNight;
  final Color iconColor;
  final Color fontColor;
  final String value;

  WeatherIndicator({
    this.iconSize = 24,
    this.fontSize,
    this.isNight = false,
    this.iconColor = Styles.whiteColor,
    this.fontColor = Styles.whiteColor,
    this.value = '30º / 25º',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          isNight ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          size: iconSize.h,
          color: iconColor,
        ),
        DefaultSizedBox.vertical(5),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize ?? Styles.smallerRegularSize,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
