import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import '../icon_image_path.dart';
import '../constants/app_constants.dart';
import './main_notification_button.dart';

class DefaultAppBar extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final double titleLeftPadding;
  final bool hasNotificationButton;

  DefaultAppBar({
    this.title = '',
    this.trailing,
    this.titleLeftPadding = 0,
    this.hasNotificationButton = true,
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
      child: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
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
                    fit: BoxFit.contain,
                  ),
                  if (hasNotificationButton) MainNotificationButton(),
                ],
              ),
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
                Padding(
                  padding: EdgeInsets.only(
                    left: titleLeftPadding,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Styles.whiteColor,
                        fontSize: 21.sp,
                        fontWeight: Styles.boldText),
                  ),
                ),
                _buildTrailing()!,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildTrailing() {
    if (trailing != null) return trailing;

    return Image.asset(
      AppIcons.back,
      width: 25.h,
      height: 25.h,
      fit: BoxFit.contain,
      color: Colors.transparent,
    );
  }
}
