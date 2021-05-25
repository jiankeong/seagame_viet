import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import '../icon_image_path.dart';
import '../constants/app_constants.dart';
import './main_notification_button.dart';

class DefaultAppBar extends StatelessWidget {
  final String title;

  DefaultAppBar({
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Styles.whiteColor, boxShadow: [
        BoxShadow(
          blurRadius: 5,
          spreadRadius: 0.3,
          offset: Offset(-1, 1),
          color: Styles.blackColor.withOpacity(0.5),
        )
      ]),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                kDefaultScreenHorizontalPadding.w,
                12.h,
                (kDefaultScreenHorizontalPadding - 12).w,
                12.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.smallLogo,
                    width: 167.w,
                    height: 54.h,
                    fit: BoxFit.cover,
                  ),
                  MainNotificationButton(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Styles.primaryColor,
              ),
              padding: EdgeInsets.fromLTRB(
                kDefaultScreenHorizontalPadding.w,
                12.h,
                (kDefaultScreenHorizontalPadding - 10).w,
                12.h,
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      AppIcons.back,
                      width: 25.h,
                      height: 25.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Styles.whiteColor,
                        fontSize: 21.sp,
                        fontWeight: Styles.boldText),
                  ),
                  Image.asset(
                    AppIcons.back,
                    width: 25.h,
                    height: 25.h,
                    fit: BoxFit.contain,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
