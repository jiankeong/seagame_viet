import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../icon_image_path.dart';
import '../../styles.dart';

class MedalWithScore extends StatelessWidget {
  final String medal;
  final int score;

  MedalWithScore({
    this.medal = AppImages.goldMedal,
    this.score = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          medal,
          width: 54.h,
          height: 54.h,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '$score',
              style: TextStyle(
                fontSize: Styles.smallerRegularSize,
                fontWeight: Styles.boldText,
              ),
            ),
          ),
        )
      ],
    );
  }
}
