import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../default_sized_box.dart';
import '../../styles.dart';
import '../result_containers/result_containers.dart';
import '../../app_strings.dart';
import '../../globals.dart';
import '../../icon_image_path.dart';

class CompetitionResultDialog extends StatelessWidget {
  final Map<String, dynamic> _data = {
    "start_time": "2021-12-02 18:00:00",
    "end_time": "2021-12-02 23:00:00",
    "location": "ISA SPORTS CITY",
    "sport": "Badminton",
    "event": "Men's Singles Quarterfinals",
    "galleries": [
      'https://www.globaltimes.cn/Portals/0/attachment/2020/2020-05-20/b35faab5-d681-428b-8868-8532cdbacc3b.jpeg',
      'https://i.ytimg.com/vi/5_YmSE1Vs4w/maxresdefault.jpg',
      'https://static.bangkokpost.com/media/content/20200519/c1_3636952.jpg',
      'https://d3avoj45mekucs.cloudfront.net/rojakdaily/media/iylia/news/ldlcw1.jpg'
    ],
    "type": 0, //0: score (badminton), 1: timing (swimming)
    "total_sets": 5, // null if is timing
    "results": [
      {
        "country_flag": AppImages.malaysia,
        "country_code": "MAS",
        "won_set": 3,
        "scores": [21, 21, 19, 21, null],
        "players_name": ['C.W. Lee'],
      },
      {
        "country_flag": AppImages.indonesia,
        "country_code": "INA",
        "won_set": 1,
        "scores": [17, 18, 21, 19, null],
        "players_name": ['M.C. Gideon'],
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Globals().getScreenWidth() * 0.05),
          child: Container(
            decoration: BoxDecoration(
              color: Styles.whiteColor,
              borderRadius: BorderRadius.circular(10.h),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 25.h,
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppIcons.cancel,
                        width: 25.h,
                        height: 25.h,
                        fit: BoxFit.contain,
                        color: Colors.transparent,
                      ),
                      Text(
                        AppStrings.results.tr(),
                        style: TextStyle(
                          color: Styles.primaryColor,
                          fontSize: 21.sp,
                          fontWeight: Styles.boldText,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppIcons.cancel,
                          width: 25.h,
                          height: 25.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  DefaultSizedBox.vertical(35),
                  ScoreResultContainer(
                    matchResult: _data,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
