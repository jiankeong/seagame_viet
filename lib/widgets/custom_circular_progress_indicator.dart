import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double size;
  final double strokeWidth;

  CustomCircularProgressIndicator({
    this.size = 24,
    this.color = Styles.primaryColor,
    this.strokeWidth = 3
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.h,
      height: size.h,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth.h,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
