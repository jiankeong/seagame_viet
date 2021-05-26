import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app_strings.dart';
import '../../icon_image_path.dart';
import '../default_sized_box.dart';
import '../../styles.dart';
import '../../screens/screens.dart';

class DashboardOptionsGrid extends StatelessWidget {
  final List<DashboardOption> _options = [
    DashboardOption(icon: AppIcons.live, label: AppStrings.live),
    DashboardOption(icon: AppIcons.schedule, label: AppStrings.schedule),
    DashboardOption(
      icon: AppIcons.games,
      label: AppStrings.games,
      routeName: GamesScreen.routeName,
    ),
    DashboardOption(icon: AppIcons.competition, label: AppStrings.competition),
    DashboardOption(icon: AppIcons.result, label: AppStrings.result),
    DashboardOption(icon: AppIcons.medalTally, label: AppStrings.medalTally),
    DashboardOption(icon: AppIcons.athletes, label: AppStrings.athletes),
    DashboardOption(icon: AppIcons.teams, label: AppStrings.teams),
    DashboardOption(icon: AppIcons.medical, label: AppStrings.medical),
    DashboardOption(icon: AppIcons.arCamera, label: AppStrings.arCamera),
    DashboardOption(icon: AppIcons.location, label: AppStrings.location),
    DashboardOption(icon: AppIcons.cityGuides, label: AppStrings.cityGuide),
    DashboardOption(icon: AppIcons.news, label: AppStrings.news),
    DashboardOption(icon: AppIcons.media, label: AppStrings.media),
    DashboardOption(
      icon: AppIcons.gallery,
      label: AppStrings.gallery,
      routeName: GalleryMenuScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.social,
      label: AppStrings.social,
      routeName: SocialScreen.routeName,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (cotnext, index) {
        DashboardOption option = _options[index];

        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if (option.routeName != null)
              Navigator.pushNamed(
                context,
                option.routeName!,
              );
          },
          child: Column(
            children: [
              Image.asset(
                option.icon!,
                width: 48.h,
                height: 48.h,
                fit: BoxFit.contain,
              ),
              DefaultSizedBox.vertical(5),
              Text(
                '${option.label!.tr()}',
                style: TextStyle(
                    color: Styles.nero, fontSize: Styles.smallerRegularSize),
              )
            ],
          ),
        );
      },
      itemCount: _options.length,
    );
  }
}

class DashboardOption {
  final String? icon;
  final String? label;
  final String? routeName;

  DashboardOption({
    required this.icon,
    required this.label,
    this.routeName,
  });
}
