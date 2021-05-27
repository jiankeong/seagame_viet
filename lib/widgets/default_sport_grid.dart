import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../styles.dart';
import './default_sized_box.dart';
import '../app_strings.dart';
import '../icon_image_path.dart';
import '../screens/games_detail_screen.dart';
import './sport_icon_container.dart';

class DefaultSportGrid extends StatefulWidget {
  final String? moveToScreenRouteName;
  final List<Map<String, dynamic>>? sportList;
  final Map<String, dynamic>? country;

  DefaultSportGrid({
    this.moveToScreenRouteName = GamesDetailScreen.routeName,
    this.sportList,
    this.country,
  });

  @override
  _DefaultSportGridState createState() => _DefaultSportGridState();
}

class _DefaultSportGridState extends State<DefaultSportGrid> {
  List<Map<String, dynamic>> _sportList = [
    {
      "name": AppStrings.archery,
      "icon": AppIcons.archery,
    },
    {
      "name": AppStrings.aquatics,
      "icon": AppIcons.aquatics,
    },
    {
      "name": AppStrings.atheletics,
      "icon": AppIcons.atheletics,
    },
    {
      "name": AppStrings.basketball,
      "icon": AppIcons.basketball,
    },
    {
      "name": AppStrings.beachVolleyBall,
      "icon": AppIcons.beachVolleyBall,
    },
    {
      "name": AppStrings.boxing,
      "icon": AppIcons.boxing,
    },
    {
      "name": AppStrings.canoeKayak,
      "icon": AppIcons.canoeKayak,
    },
    {
      "name": AppStrings.cycling,
      "icon": AppIcons.cycling,
    },
    {
      "name": AppStrings.dancesport,
      "icon": AppIcons.dancesport,
    },
    {
      "name": AppStrings.diving,
      "icon": AppIcons.diving,
    },
    {
      "name": AppStrings.fencing,
      "icon": AppIcons.fencing,
    },
    {
      "name": AppStrings.football,
      "icon": AppIcons.football,
    },
    {
      "name": AppStrings.golf,
      "icon": AppIcons.golf,
    },
    {
      "name": AppStrings.gymnastics,
      "icon": AppIcons.gymnastics,
    },
    {
      "name": AppStrings.handball,
      "icon": AppIcons.handball,
    },
    {
      "name": AppStrings.judo,
      "icon": AppIcons.judo,
    },
    {
      "name": AppStrings.shooting,
      "icon": AppIcons.shooting,
    },
    {
      "name": AppStrings.tennis,
      "icon": AppIcons.tennis,
    },
    {
      "name": AppStrings.weightlifting,
      "icon": AppIcons.weightlifting,
    },
    {
      "name": AppStrings.wrestling,
      "icon": AppIcons.wrestling,
    },
  ];

  @override
  void initState() {
    super.initState();

    if(widget.sportList != null) {
      _sportList = widget.sportList!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 0.93),
      itemBuilder: (context, index) {
        Map<String, dynamic> sport = _sportList[index];

        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, widget.moveToScreenRouteName!, arguments: {
              "id": index,
              "name": sport['name'],
              "country": widget.country,
            });
          },
          child: Column(
            children: [
              SportIconContainer(
                icon: sport['icon'],
              ),
              DefaultSizedBox.vertical(5),
              Flexible(
                child: FittedBox(
                  child: Text(
                    sport['name'].toString().tr(),
                    style: TextStyle(
                      fontSize: Styles.smallerRegularSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: _sportList.length,
    );
  }
}
