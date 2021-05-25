import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_shadow_container.dart';
import '../widgets/header_profile_container.dart';
import '../globals.dart';
import '../app_strings.dart';
import '../constants/app_constants.dart';
import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../utils/date_format_utils.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';
import '../widgets/label_value_vertical_layout.dart';
import '../widgets/default_button.dart';
import '../screens/change_password_screen.dart';
import '../providers/auth_provider.dart';
import './home_screen_stack.dart';
import '../providers/route_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      User? user = userProvider.user;

      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _buildPersonalDetails(user),
                HeaderProfileContainer(),
              ],
            ),
            DefaultSizedBox.vertical(20),
            _buildContactDetails(user),
            DefaultSizedBox.vertical(30),
            DefaultButton(
              width: 295.w,
              buttonText: AppStrings.changePassword,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ChangePasswordScreen.routeName,
                );
              },
            ),
            DefaultSizedBox.vertical(15),
            DefaultButton(
              width: 295.w,
              buttonText: AppStrings.logout,
              color: Styles.primaryDarkColor,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Provider.of<UserProvider>(context, listen: false).reset();
                Provider.of<RouteProvider>(context, listen: false).resetRoute();

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeScreenStack.routeName,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPersonalDetails(User? user) {
    return CustomShadowContainer(
      bottomPadding: 25.h,
      height: Globals().getScreenHeight() * 0.43,
      roundedCorner: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultScreenHorizontalPadding.w + 8.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.personalDetails.tr(),
                  style: TextStyle(
                    fontSize: Styles.titleFontSize,
                    color: Styles.primaryColor,
                    fontWeight: Styles.boldText,
                  ),
                ),
                DefaultSizedBox.vertical(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: LabelValueVerticalLayout(
                        label: AppStrings.dateOfBirth.tr().toUpperCase(),
                        value: DateFormatUtils.monthDateYear(
                          user!.dateOfBirth!,
                        ).toUpperCase(),
                      ),
                    ),
                    DefaultSizedBox.horizontal(15),
                    Expanded(
                      child: LabelValueVerticalLayout(
                        label: AppStrings.gender.tr().toUpperCase(),
                        value: user.gender!.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDetails(User? user) {
    return CustomShadowContainer(
      roundedCorner: false,
      leftPadding: kDefaultScreenHorizontalPadding.w + 8.w,
      rightPadding: kDefaultScreenHorizontalPadding.w + 8.w,
      topPadding: 24.h,
      bottomPadding: 25.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.contactDetails.tr(),
            style: TextStyle(
              fontSize: Styles.titleFontSize,
              color: Styles.primaryColor,
              fontWeight: Styles.boldText,
            ),
          ),
          DefaultSizedBox.vertical(20),
          LabelValueVerticalLayout(
            label: AppStrings.phoneNumber.tr().toUpperCase(),
            value: user!.mobileNumber!,
          ),
          DefaultSizedBox.vertical(20),
          LabelValueVerticalLayout(
            label: AppStrings.email.tr().toUpperCase(),
            value: user.email!,
          ),
        ],
      ),
    );
  }
}
