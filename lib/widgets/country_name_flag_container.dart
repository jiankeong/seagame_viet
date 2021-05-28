import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_padding.dart';
import '../styles.dart';
import './default_sized_box.dart';

class CountryNameFlagContainer extends StatelessWidget {
  final String? countryFlag;
  final String? countryName;

  CountryNameFlagContainer({
    this.countryFlag,
    this.countryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.primaryDarkColor,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: DefaultPadding(
        child: Row(
          children: [
            Image.asset(
              countryFlag!,
              width: 43.w,
              height: 29.h,
              fit: BoxFit.contain,
            ),
            DefaultSizedBox.horizontal(15),
            Flexible(
              child: Text(
                countryName.toString().tr(),
                style: TextStyle(
                  color: Styles.whiteColor,
                  fontWeight: Styles.boldText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}