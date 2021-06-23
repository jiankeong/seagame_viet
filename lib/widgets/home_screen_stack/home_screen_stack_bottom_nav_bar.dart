import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/route_provider.dart';
import '../fab_bottom_app.bar.dart';
import '../../styles.dart';
import '../../screens/home_screen_stack.dart';
import '../../screens/login_screen.dart';
import '../../utils/build_toast.dart';
import '../../providers/auth_provider.dart';
import '../../app_strings.dart';
import '../../screens/helpdesk_screen.dart';
import '../../screens/my_tickets_screen.dart';
import '../../screens/e_shop_screen.dart';
import '../../utils/general_functions.dart';

class HomeScreenStackBottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> bottomNavBarItems;

  HomeScreenStackBottomNavBar({
    required this.bottomNavBarItems,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteProvider>(
      builder: (context, routeProvider, child) {
        return FABBottomAppBar(
          onTabSelected: (int index) {
            final redirected = notLoginRedirection(context);

            if (redirected) return;

            if (index == 0) {
              bool success = canAccessAccrediation(context);
              
              if (!success) {
                buildToast1(AppStrings.withoutPermission);
                return;
              }
            }

            routeProvider.updateRoute(index);

            if (index != 3) {
              Navigator.pushNamed(context, moveToScreenName(index));
            }
          },
          items: [
            for (int i = 0; i < bottomNavBarItems.length; i++)
              FABBottomAppBarItem(
                text: Text(
                  bottomNavBarItems[i].label.toUpperCase(),
                  style: TextStyle(
                    fontSize: Styles.fontSize10,
                    color: Styles.sonicSilver,
                  ),
                ),
                icon: Image.asset(
                  bottomNavBarItems[i].activeIconPath,
                  width: 25.w,
                  height: 35.h,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        );
      },
    );
  }

  bool notLoginRedirection(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (!authProvider.hasLogin()) {
      buildToast1(AppStrings.pleaseLoginBeforeProceed);
      Navigator.pushNamed(context, LoginScreen.routeName);
      return true;
    }

    return false;
  }

  String moveToScreenName(int index) {
    switch (index) {
      case 0:
        return MyTicketsScreen.routeName;
      case 1:
        return EShopScreen.routeName;
      case 2:
        return HelpdeskScreen.routeName;
      default:
        return HelpdeskScreen.routeName;
    }
  }
}
