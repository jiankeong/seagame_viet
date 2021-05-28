import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../icon_image_path.dart';
import '../app_strings.dart';
import './default_sized_box.dart';
import './custom_shadow_container.dart';
import '../styles.dart';
import './default_padding.dart';

class CountryList extends StatelessWidget {
  final Function(Map<String, dynamic>?)? onPressed;

  CountryList({this.onPressed});

  final List<Map<String, dynamic>> _countryList = [
    {
      "id": 1,
      "flag": AppImages.brunei,
      "name": AppStrings.bruneiFull,
    },
    {
      "id": 2,
      "flag": AppImages.cambodia,
      "name": AppStrings.cambodia,
    },
    {
      "id": 3,
      "flag": AppImages.indonesia,
      "name": AppStrings.indonesia,
    },
    {
      "id": 4,
      "flag": AppImages.laos,
      "name": AppStrings.laosFull,
    },
    {
      "id": 5,
      "flag": AppImages.malaysia,
      "name": AppStrings.malaysia,
    },
    {
      "id": 6,
      "flag": AppImages.myanmar,
      "name": AppStrings.myanmar,
    },
    {
      "id": 7,
      "flag": AppImages.philippines,
      "name": AppStrings.philippines,
    },
    {
      "id": 8,
      "flag": AppImages.singapore,
      "name": AppStrings.singapore,
    },
    {
      "id": 9,
      "flag": AppImages.thailand,
      "name": AppStrings.thailand,
    },
    {
      "id": 10,
      "flag": AppImages.timorLeste,
      "name": AppStrings.timorLeste,
    },
    {
      "id": 11,
      "flag": AppImages.vietnam,
      "name": AppStrings.vietnam,
    },
  ];

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
