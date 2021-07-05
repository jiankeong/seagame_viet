import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../styles.dart';
import './default_sized_box.dart';
import '../screens/games_detail_screen.dart';
import './sport_icon_container.dart';
import '../constants/app_constants.dart';

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
  List<Map<String, dynamic>> _sportList = kSportList;

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
          crossAxisCount: 4, childAspectRatio: 0.88),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Text(
                    sport['name'].toString().tr(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
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
