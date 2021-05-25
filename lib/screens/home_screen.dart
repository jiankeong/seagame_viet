import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/header_profile_container.dart';
import '../widgets/home_screen.dart/home_screen_widgets.dart';
import '../constants/app_constants.dart';
import '../icon_image_path.dart';
import '../widgets/default_sized_box.dart';
import '../styles.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          HeaderProfileContainer(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: DashboardOptionsGrid(),
                  ),
                ),
                DefaultSizedBox.vertical(12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.3,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                              color: Styles.blackColor.withOpacity(0.1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15.h),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.h),
                          child: Image.asset(
                            AppImages.seagame2021Banner,
                            width: 267.w,
                            height: 116.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -40.0,
                      top: 20,
                      child: Image.asset(
                        AppImages.mascot,
                        width: 108.w,
                        height: 125.h,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
