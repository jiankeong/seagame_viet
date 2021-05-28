import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';
import '../default_padding.dart';
import '../custom_shadow_container.dart';
import '../default_sized_box.dart';
import '../default_divider.dart';
import '../../screens/athlete_info_screen.dart';

class AthleteByName extends StatefulWidget {
  final Map<String, dynamic> categories;
  final List<Map<String, dynamic>> athletes;

  AthleteByName(
      {Map<String, dynamic>? categories, List<Map<String, dynamic>>? athletes})
      : categories = categories == null ? {} : categories,
        athletes = athletes == null ? [] : athletes;

  @override
  _AthleteByNameState createState() => _AthleteByNameState();
}

class _AthleteByNameState extends State<AthleteByName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: DefaultPadding(
            child: Text(
              widget.categories['starting_character'],
            ),
          ),
        ),
        CustomShadowContainer(
          topPadding: 10.h,
          bottomPadding: 10.h,
          roundedCorner: false,
          child: DefaultPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < widget.athletes.length; i++)
                  _buildPlayerInfoContainer(i),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlayerInfoContainer(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPlayerInfo(i),
        if (i < widget.athletes.length - 1)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultSizedBox.vertical(5),
              DefaultDivider(),
            ],
          )
      ],
    );
  }

  Widget _buildPlayerInfo(int i) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AthleteInfoScreen.routeName,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNameAndSport(i),
                DefaultSizedBox.horizontal(15),
                _buildMedal(i),
              ],
            ),
            DefaultSizedBox.vertical(15),
            Text(
              widget.athletes[i]['event'].join(", ").toString().toUpperCase(),
              style: TextStyle(
                fontSize: Styles.smallerRegularSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameAndSport(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.athletes[i]['name'].toString().toUpperCase(),
          style: TextStyle(
            fontSize: Styles.smallerTitleFontSize,
            color: Styles.primaryColor,
            fontWeight: Styles.boldText,
          ),
        ),
        DefaultSizedBox.vertical(10),
        Text(widget.athletes[i]['sport'].toString().toUpperCase(),
            style: TextStyle(
              fontSize: Styles.smallerTitleFontSize,
              color: Styles.primaryDarkColor,
            )),
      ],
    );
  }

  Widget _buildMedal(int i) {
    return Row(
      children: [
        for (int j = 0; j < widget.athletes[i]['medals'].length; j++)
          Row(
            children: [
              Image.asset(
                widget.athletes[i]['medals'][j],
                width: 30.h,
                height: 30.h,
              ),
              if (j < widget.athletes[i]['medals'].length - 1)
                DefaultSizedBox.horizontal(8),
            ],
          ),
      ],
    );
  }
}
