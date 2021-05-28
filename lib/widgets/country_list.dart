import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import './default_sized_box.dart';
import './custom_shadow_container.dart';
import '../styles.dart';
import './default_padding.dart';
import '../constants/app_constants.dart';

class CountryList extends StatelessWidget {
  final Function(Map<String, dynamic>?)? onPressed;

  CountryList({this.onPressed});

    final List<Map<String, dynamic>> _countryList = kCountryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      // physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Map<String, dynamic> country = _countryList[index];

        return Column(
          children: [
            if (index == 0) DefaultSizedBox.vertical(10),
            InkWell(
              onTap: () {
                onPressed!(country);
              },
              child: DefaultPadding(
                top: 20,
                bottom: 20,
                child: Row(
                  children: [
                    CustomShadowContainer(
                      width: 54.w,
                      height: 32.h,
                      roundedCorner: false,
                      backgroundImage: country['flag'],
                    ),
                    DefaultSizedBox.horizontal(15),
                    Flexible(
                      child: Text(
                        country['name'].toString().tr(),
                        style: TextStyle(
                          fontSize: Styles.smallerTitleFontSize,
                          color: Styles.primaryDarkColor,
                          fontWeight: Styles.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      itemCount: _countryList.length,
    );
  }
}
