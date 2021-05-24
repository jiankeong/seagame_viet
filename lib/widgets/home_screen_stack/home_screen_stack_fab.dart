import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../styles.dart';
import '../../icon_image_path.dart';
import '../../providers/route_provider.dart';

class HomeScreenStackFAB extends StatelessWidget {
  const HomeScreenStackFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteProvider>(
      builder: (context, routeProvider, child) {
        return InkWell(
          onTap: () {
            routeProvider.updateRoute(999);
          },
          child: Container(
            height: 65.h,
            width: 65.h,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Styles.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Styles.blackColor.withOpacity(0.3),
                  spreadRadius: 0.3,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              AppImages.logoArt,
              width: 65.h,
              height: 65.h,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
