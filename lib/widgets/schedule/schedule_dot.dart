import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';

class ScheduleDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Styles.primaryColor),
      width: 9.h,
      height: 9.h,
    );
  }
}
