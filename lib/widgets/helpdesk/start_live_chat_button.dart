import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../styles.dart';
import '../../app_strings.dart';
import '../../icon_image_path.dart';

class StartLiveChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 225.w,
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 15.h, 15.h),
          decoration: BoxDecoration(
            color: Styles.primaryColor,
            borderRadius: BorderRadius.circular(25.h),
          ),
          child: Text(
            AppStrings.startLiveChat.tr().toUpperCase(),
            style: TextStyle(
              color: Styles.whiteColor,
              fontSize: 19.sp,
              fontWeight: Styles.boldText,
            ),
          ),
        ),
        Positioned(
          right: 6.0,
          bottom: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Styles.whiteColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(3.h),
            child: Image.asset(
              AppIcons.liveChat,
              width: 35.w,
              height: 35.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
