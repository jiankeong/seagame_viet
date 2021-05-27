import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> buildBottomSheet(BuildContext context, Widget item,
    {double heightScale = 0.3}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0.h),
        topRight: Radius.circular(10.0.h),
      ),
    ),
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * heightScale,
      child: item,
    ),
  );
}
