import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/custom_shadow_container.dart';
import '../globals.dart';
import '../icon_image_path.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/default_sized_box.dart';
import '../app_strings.dart';
import '../styles.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          CustomShadowContainer(
            height: Globals().getScreenHeight() * 0.27,
            backgroundImage: AppImages.homeProfileContainerBg,
            leftPadding: 25.w,
            rightPadding: 25.w,
            topPadding: 8.h,
            bottomPadding: 8.h,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.smallLogo,
                        width: 167.w,
                        height: 54.h,
                      ),
                      Image.asset(
                        AppIcons.notificationOff,
                        width: 34.h,
                        height: 34.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  DefaultSizedBox.vertical(15),
                  Row(
                    children: [
                      ProfileAvatar(
                        profileImgUrl: null,
                        radius: 48.w,
                      ),
                      DefaultSizedBox.horizontal(10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.welcomeGuest.tr().toUpperCase(),
                              style: TextStyle(
                                color: Styles.primaryColor,
                                fontSize: 21.sp,
                                fontWeight: Styles.boldText,
                              ),
                            ),
                            DefaultSizedBox.vertical(5),
                            Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    width: 168.w,
                                    height: 56.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Styles.primaryDarkColor,
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            '${AppStrings.joinUsToday.tr().toUpperCase()}!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Styles.whiteColor,
                                              fontSize: Styles.titleFontSize,
                                              fontWeight: Styles.boldText,
                                            ),
                                          ),
                                        ),
                                        DefaultSizedBox.vertical(3),
                                        Text(
                                          AppStrings.joinUSTodayInfoText.tr(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Styles.fontSize10,
                                            color: Styles.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DefaultSizedBox.horizontal(5),
                                Container(
                                  width: 56.h,
                                  height: 56.h,
                                  padding: EdgeInsets.all(9.h),
                                  decoration: BoxDecoration(
                                    color: Styles.primaryColor,
                                    borderRadius: BorderRadius.circular(5.h),
                                  ),
                                  child: Image.asset(
                                    AppIcons.qr,
                                    width: 37.h,
                                    height: 37.h,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
