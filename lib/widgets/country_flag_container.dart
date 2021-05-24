import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../icon_image_path.dart';

class CountryFlagContainer extends StatelessWidget {
  final String countryFlag;

  const CountryFlagContainer({
    this.countryFlag = AppImages.malaysia,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 89.w,
      height: 62.h,
      decoration: BoxDecoration(
        image:
            DecorationImage(fit: BoxFit.cover, image: AssetImage(countryFlag)),
      ),
    );
  }
}