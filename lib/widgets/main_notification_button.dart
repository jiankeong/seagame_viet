import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sea_games_gms/providers/auth_provider.dart';

import '../icon_image_path.dart';
import '../styles.dart';
import './default_sized_box.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';
import '../utils/build_toast.dart';
import '../app_strings.dart';
import '../screens/login_screen.dart';
import '../screens/notification_screen.dart';

class MainNotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () async {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        if(!authProvider.hasLogin()) {
          buildToast1(AppStrings.pleaseLoginBeforeProceed);
          Navigator.pushNamed(context, LoginScreen.routeName);
          return;
        }

        Navigator.pushNamed(context, NotificationScreen.routeName);
      },
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (!authProvider.hasLogin()) return _buildNotificationBell(false, 0);

          return Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              User? user = userProvider.user;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: _buildNotificationBell(
                      authProvider.hasLogin(),
                      user!.notificationCount == null
                          ? 0
                          : user.notificationCount,
                    ),
                  ),
                  Positioned(
                    right: 1,
                    bottom: -3,
                    child: user.notificationCount == null ||
                            user.notificationCount! <= 0
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(
                              5.h,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Styles.redColor,
                              border: Border.all(
                                width: 1.0,
                                color: Styles.whiteColor,
                              ),
                            ),
                            child: DefaultSizedBox(
                              verticalSpacing: 10,
                              horizontalSpacing: 10,
                              child: FittedBox(
                                child: Text(
                                  '${user.notificationCount}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: Styles.fontSize10,
                                    color: Styles.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildNotificationBell(bool? hasLogin, int? notificationCount) {
    String icon = AppIcons.notificationOff;

    if (hasLogin! && notificationCount! > 0) {
      icon = AppIcons.notificationOn;
    }

    return Image.asset(
      icon,
      width: 35.h,
      height: 35.h,
      fit: BoxFit.contain,
    );
  }
}
