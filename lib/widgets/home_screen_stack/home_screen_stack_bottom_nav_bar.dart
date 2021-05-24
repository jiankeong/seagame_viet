import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../providers/route_provider.dart';
import '../fab_bottom_app.bar.dart';
import '../../styles.dart';
import '../../screens/home_screen_stack.dart';

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
            routeProvider.updateRoute(index);
          },
          items: [
            for (int i = 0; i < bottomNavBarItems.length; i++)
              FABBottomAppBarItem(
                text: Text(
                  bottomNavBarItems[i].label.tr().toUpperCase(),
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
}
