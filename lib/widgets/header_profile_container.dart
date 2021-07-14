import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../icon_image_path.dart';
import './custom_shadow_container.dart';
import '../globals.dart';
import './default_sized_box.dart';
import '../app_strings.dart';
import '../styles.dart';
import './profile_avatar.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';
import '../screens/login_screen.dart';
import '../utils/user_type_mapper.dart';
import './main_notification_button.dart';
import '../screens/my_tickets_screen.dart';
import '../utils/general_functions.dart';
import '../utils/build_toast.dart';

class HeaderProfileContainer extends StatelessWidget {
  const HeaderProfileContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return CustomShadowContainer(
        height: Globals().getScreenHeight() * 0.275,
        backgroundImage: AppImages.homeProfileContainerBg,
        leftPadding: 25.w,
        rightPadding: 25.w,
        topPadding: 8.h,
        bottomPadding: 8.h,
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: _buildLogoNotificationSection(),
            ),
            DefaultSizedBox.vertical(15),
            _buildInfoSection(context, authProvider.hasLogin()),
          ],
        ),
      );
    });
  }

  Widget _buildLogoNotificationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.bahrainSmallLogo,
          width: 167.w,
          height: 54.h,
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
        MainNotificationButton(),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context, bool hasLogin) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        User? user = userProvider.user;

        return Row(
          children: [
            ProfileAvatar(
              profileImgUrl: hasLogin ? user!.profileImgUrl : null,
              radius: Globals().getScreenHeight() < 790 ? 48.h : 35.h,
            ),
            DefaultSizedBox.horizontal(10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hasLogin
                        ? '${user!.fullName!}'
                        : AppStrings.welcomeGuest.tr().toUpperCase(),
                    style: TextStyle(
                      color: Styles.primaryColor,
                      fontSize: 21.sp,
                      fontWeight: Styles.boldText,
                    ),
                  ),
                  DefaultSizedBox.vertical(hasLogin ? 8 : 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: !hasLogin
                            ? _buildJoinUsContainer(context)
                            : _buildUserInfoContainer(user!),
                      ),
                      DefaultSizedBox.horizontal(5),
                      InkWell(
                        onTap: () => _qrContainerOnPressed(context, hasLogin),
                        child: _buildQrContainer(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildJoinUsContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          LoginScreen.routeName,
        );
      },
      child: Container(
        height: 57.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color: Styles.primaryDarkColor,
          borderRadius: BorderRadius.circular(5.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Flexible(
              child: Text(
                AppStrings.joinUSTodayInfoText.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.locale == Locale('zh')
                      ? 7.8.sp
                      : Styles.fontSize10,
                  color: Styles.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrContainer() {
    return Container(
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
    );
  }

  void _qrContainerOnPressed(BuildContext context, bool hasLogin) {
    if (!hasLogin) {
      Navigator.pushNamed(
        context,
        LoginScreen.routeName,
      );
    } else {
      bool success = canAccessAccrediation(context);

      if (!success) {
        buildToast1(AppStrings.withoutPermission);
        return;
      }

      Navigator.pushNamed(context, MyTicketsScreen.routeName);
    }
  }

  Widget _buildUserInfoContainer(User? user) {
    return Container(
      height: 56.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: user!.countryFlagUrl!,
                  errorWidget: (_, __, ___) => Container(),
                  width: 39.w,
                  height: 23.h,
                  fit: BoxFit.fill,
                ),
                DefaultSizedBox.horizontal(10),
                Flexible(
                  child: FittedBox(
                    child: Text(
                      user.country!.toUpperCase(),
                      style: TextStyle(
                        fontSize: Styles.titleFontSize,
                        color: Styles.outerSpace,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DefaultSizedBox.vertical(10),
          FittedBox(
            child: Text(
              UserTypeMapper.toUserTypeString(
                user.userType!,
              ).tr(),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 17.sp,
                color: Styles.outerSpace.withOpacity(0.65),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
