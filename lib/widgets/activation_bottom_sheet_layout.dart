import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import './default_sized_box.dart';
import '../styles.dart';
import '../icon_image_path.dart';
import '../app_strings.dart';
import './default_divider.dart';
import './default_padding.dart';
import './default_button.dart';
import '../globals.dart';
import './accrediation_ticket_layout.dart';
import '../models/user.dart';

class ActivationBottomSheetLayout extends StatefulWidget {
  @override
  _ActivationBottomSheetLayoutState createState() =>
      _ActivationBottomSheetLayoutState();
}

class _ActivationBottomSheetLayoutState
    extends State<ActivationBottomSheetLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultSizedBox.vertical(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppIcons.cancel,
                width: 20.h,
                height: 20.h,
                color: Colors.transparent,
              ),
              Text(
                AppStrings.activateAccrediation.tr(),
                style: TextStyle(
                  fontSize: Styles.titleFontSize,
                  fontWeight: Styles.boldText,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  AppIcons.cancel,
                  width: 20.h,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
        DefaultSizedBox.vertical(15),
        DefaultDivider(),
        Expanded(
          child: SingleChildScrollView(
            child: DefaultPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultSizedBox.vertical(20),
                  // Text(
                  //   '${AppStrings.activationConfirmationDescription.tr()}?',
                  //   style: TextStyle(
                  //     fontSize: 15.sp,
                  //   ),
                  // ),
                  // DefaultSizedBox.vertical(25),
                  AccrediationTicketLayout(
                      user: User.fromJson({
                    "id": 1,
                    "fullname": "Lee Chong Wei",
                    "account_id": "LORME",
                    "email": "dlcw@gmail.com",
                    "phone": "+6017 888 8888",
                    "country": "Malaysia",
                    "profile_image": {
                      "url":
                          "https://bwfbadminton.com/wp-content/uploads/2020/05/Lee-Chong-Wei-12-scaled.jpg"
                    },
                    "user_type": 1,
                    "gender": "Male",
                    "date_of_birth": "1982-10-21 00:00:00",
                    "country_flag": {
                      "url":
                          "https://www.countryflags.com/wp-content/uploads/malaysia-flag-png-large.png",
                    },
                    "notification_count": 3,
                  })),
                  DefaultSizedBox.vertical(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultButton(
                        width: Globals().getScreenWidth() * 0.4,
                        buttonText: AppStrings.deactivate.tr(),
                        fontSize: 14.sp,
                        horizontalPadding: 5.w,
                        color: Styles.grey65,
                      ),
                      DefaultSizedBox.horizontal(5),
                      DefaultButton(
                        width: Globals().getScreenWidth() * 0.4,
                        buttonText: AppStrings.activate.tr(),
                        fontSize: 14.sp,
                        horizontalPadding: 5.w,
                      ),
                    ],
                  ),
                  DefaultSizedBox.vertical(30),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
