import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../app_strings.dart';
import '../../icon_image_path.dart';
import '../default_sized_box.dart';
import '../../styles.dart';
import '../../screens/screens.dart';
import '../../providers/auth_provider.dart';
import '../../utils/build_toast.dart';

class DashboardOptionsGrid extends StatelessWidget {
  final List<DashboardOption> _options = [
    DashboardOption(
      icon: AppIcons.live,
      label: AppStrings.live,
      routeName: LiveMenuScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.schedule,
      label: AppStrings.schedule,
      routeName: ScheduleScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.games,
      label: AppStrings.games,
      routeName: GamesScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.competition,
      label: AppStrings.competition,
      routeName: CompetitionScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.result,
      label: AppStrings.results,
      routeName: ResultListScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.medalTally,
      label: AppStrings.medalTally,
      routeName: MedalTallyScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.athletes,
      label: AppStrings.athletes,
      routeName: AthleteListScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.teams,
      label: AppStrings.teams,
      routeName: TeamMenuScreen.routeName,
    ),
    DashboardOption(
        icon: AppIcons.medical,
        label: AppStrings.medical,
        routeName: MedicalScreen.routeName),
    DashboardOption(icon: AppIcons.arCamera, label: AppStrings.arCamera),
    DashboardOption(
      icon: AppIcons.location,
      label: AppStrings.location,
      routeName: LocationScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.cityGuides,
      label: AppStrings.cityGuide,
      routeName: CityGuideScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.news,
      label: AppStrings.news,
      routeName: NewsMenuScreen.routeName,
    ),
    DashboardOption(
      icon: AppIcons.media,
      label: AppStrings.media,
      routeName: MediaScreen.routeName,
    ),
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
            if (option.routeName != null) {
              if (option.routeName == CompetitionScreen.routeName) {
                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);

                if (!authProvider.hasLogin()) {
                  buildToast1(AppStrings.pleaseLoginBeforeProceed);
                  Navigator.pushNamed(context, LoginScreen.routeName);
                  return;
                }
              }

              Navigator.pushNamed(
                context,
                option.routeName!,
              );
            }
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
