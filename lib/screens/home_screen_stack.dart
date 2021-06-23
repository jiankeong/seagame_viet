import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../icon_image_path.dart';
import '../app_strings.dart';
import './profile_screen.dart';
import '../providers/route_provider.dart';
import '../widgets/home_screen_stack/home_screen_stack_widgets.dart';
import './home_screen.dart';

class HomeScreenStack extends StatelessWidget {
  static const routeName = '/HomeScreenStack';

  final List<BottomNavBarItem> bottomNavBarItems = [
    BottomNavBarItem(
      label: AppStrings.accreditation.tr(),
      activeIconPath: AppIcons.myTickets,
      inactiveIconPath: AppIcons.myTickets,
    ),
    BottomNavBarItem(
      label: AppStrings.eshop.tr(),
      activeIconPath: AppIcons.eShop,
      inactiveIconPath: AppIcons.eShop,
    ),
    BottomNavBarItem(
      label: AppStrings.helpdesk.tr(),
      activeIconPath: AppIcons.helpdesk,
      inactiveIconPath: AppIcons.helpdesk,
    ),
    BottomNavBarItem(
      label: AppStrings.profile.tr(),
      activeIconPath: AppIcons.profile,
      inactiveIconPath: AppIcons.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AppImages.homeScreenStackBg),
        ),
      ),
      child: Consumer<RouteProvider>(
        builder: (context, routeProvider, child) {
          return Scaffold(
            backgroundColor:
                routeProvider.currentIndex == 4 ? null : Colors.transparent,
            body: _buildBody(context, routeProvider.currentIndex),
            bottomNavigationBar: HomeScreenStackBottomNavBar(
              bottomNavBarItems: bottomNavBarItems,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              child: HomeScreenStackFAB(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, int currentIndex) {
    if (currentIndex == 3) return ProfileScreen();

    return HomeScreen();
  }
}

class BottomNavBarItem {
  String label;
  String activeIconPath;
  String inactiveIconPath;

  BottomNavBarItem({
    required this.label,
    required this.activeIconPath,
    required this.inactiveIconPath,
  });
}
