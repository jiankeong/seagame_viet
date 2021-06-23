import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_sized_box.dart';
import '../globals.dart';
import '../models/user.dart';
import '../icon_image_path.dart';
import './profile_avatar.dart';
import '../styles.dart';
import './default_cache_network_image.dart';
import '../app_strings.dart';

class AccrediationTicketLayout extends StatelessWidget {
  const AccrediationTicketLayout({
    Key? key,
    this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.ticket,
          width: Globals().getScreenWidth() * 0.85,
          height: Globals().getScreenHeight() * 0.76,
          fit: BoxFit.fill,
        ),
        Positioned(
          left: Globals().getScreenWidth() < 600
              ? 25
              : Globals().getScreenWidth() < 750
                  ? 35
                  : 45,
          top: Globals().getScreenHeight() < 550
              ? 14
              : Globals().getScreenHeight() < 650
                  ? 15
                  : Globals().getScreenHeight() < 900
                      ? 18
                      : Globals().getScreenHeight() < 1100
                          ? 20
                          : 26,
          child: user == null
              ? Container()
              : Row(
                  children: [
                    if (user!.profileImgUrl != null)
                      ProfileAvatar(
                        profileImgUrl: user!.profileImgUrl,
                        radius: 31.5,
                      ),
                    DefaultSizedBox.horizontal(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (user == null || user!.fullName == null
                                  ? ""
                                  : user!.fullName!)
                              .toUpperCase(),
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontWeight: Styles.boldText,
                            color: Styles.whiteColor,
                          ),
                        ),
                        DefaultSizedBox.vertical(1),
                        Row(
                          children: [
                            DefaultCacheNetworkImage(
                              imageUrl: user!.countryFlagUrl!,
                              width: 29.w,
                              height: 17.h,
                              boxFit: BoxFit.fill,
                            ),
                            DefaultSizedBox.horizontal(10),
                            Text(
                              (user == null || user!.country == null
                                  ? ""
                                  : user!.country!),
                              style: TextStyle(
                                  fontSize: 15.sp, color: Styles.whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        if (user != null && user!.userType! == 0)
          Positioned.fill(
              child: Center(
            child: Text(
              AppStrings.adminTicketHintText.tr(),
              style: Styles.errorHintTextStyle,
            ),
          )),
        if (user != null && isAtheleteOrVolunteer(user!.userType!))
          Positioned(
            top: Globals().getScreenHeight() * 0.165,
            left: Globals().getScreenWidth() *
                (Globals().getScreenWidth() < 365
                    ? Globals().getScreenHeight() < 600
                        ? 0.15
                        : 0.09
                    : Globals().getScreenWidth() < 600
                        ? 0.09
                        : 0.165),
            child: Column(
              children: [
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: (user == null || user!.accountId == null
                      ? ""
                      : user!.accountId!),
                  width: 187.w,
                  height: 46.h,
                  drawText: false,
                ),
                DefaultSizedBox.vertical(20),
                Container(
                  width: 187.h,
                  height: 187.h,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Styles.whiteColor,
                    border: Border.all(
                      width: 3.0,
                      color: Styles.qrContainerBorderColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: QrImage(
                    data: user == null || user!.profileImgUrl == null
                        ? ""
                        : user!.profileImgUrl!,
                  ),
                ),
                DefaultSizedBox.vertical(25),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.h, horizontal: 25.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Styles.primaryDarkColor,
                              ),
                              borderRadius: BorderRadius.circular(5.h),
                              color: Styles.whiteColor),
                          child: Text(
                            'ATH',
                            style: TextStyle(
                              fontSize: 47.sp,
                              fontWeight: Styles.boldText,
                              color: Styles.primaryDarkColor,
                            ),
                          ),
                        ),
                        DefaultSizedBox.vertical(8),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 10.h),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Styles.primaryDarkColor,
                                  ),
                                  borderRadius: BorderRadius.circular(5.h),
                                  color: Styles.whiteColor),
                              child: Text(
                                'MPC',
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: Styles.boldText,
                                  color: Styles.primaryDarkColor,
                                ),
                              ),
                            ),
                            DefaultSizedBox.horizontal(5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 10.h),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Styles.primaryDarkColor,
                                  ),
                                  borderRadius: BorderRadius.circular(5.h),
                                  color: Styles.whiteColor),
                              child: Text(
                                'GMC',
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: Styles.boldText,
                                  color: Styles.primaryDarkColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    DefaultSizedBox.horizontal(15),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 18.h),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Styles.primaryDarkColor,
                          ),
                          borderRadius: BorderRadius.circular(5.h),
                          color: Styles.whiteColor),
                      child: Text(
                        'T3',
                        style: TextStyle(
                            fontSize: 59.sp,
                            fontWeight: Styles.boldText,
                            color: Styles.primaryDarkColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        if (user != null && isAtheleteOrVolunteer(user!.userType!))
          Positioned(
            bottom: Globals().getScreenHeight() < 550
                ? 15
                : Globals().getScreenHeight() < 650
                    ? 18
                    : Globals().getScreenHeight() < 900
                        ? 25
                        : Globals().getScreenHeight() < 1100
                            ? 27
                            : 36,
            left: Globals().getScreenWidth() < 800 ? 30 : 45,
            child: Text(
              'S',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: Styles.boldText,
                  color: Styles.whiteColor),
            ),
          ),
        if (user != null && isAtheleteOrVolunteer(user!.userType!))
          Positioned(
            bottom: Globals().getScreenHeight() < 550
                ? 15
                : Globals().getScreenHeight() < 650
                    ? 18
                    : Globals().getScreenHeight() < 900
                        ? 25
                        : Globals().getScreenHeight() < 1100
                            ? 27
                            : 36,
            right: Globals().getScreenWidth() < 800 ? 30 : 45,
            child: Text(
              '2',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: Styles.boldText,
                  color: Styles.whiteColor),
            ),
          ),
      ],
    );
  }

  bool isAtheleteOrVolunteer(int userType) {
    return userType == 1 || userType == 2;
  }
}
