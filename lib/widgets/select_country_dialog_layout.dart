import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../icon_image_path.dart';
import './custom_shadow_container.dart';
import '../globals.dart';
import '../app_strings.dart';
import '../styles.dart';
import '../constants/app_constants.dart';
import './default_sized_box.dart';

class SelectCountryDialogLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Globals().getScreenHeight() * 0.15,
        horizontal: Globals().getScreenWidth() * 0.05,
      ),
      child: CustomShadowContainer(
        shadow: null,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 25.w,
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
                      width: 20.h,
                      height: 20.h,
                      color: Colors.transparent,
                    ),
                    Text(
                      AppStrings.selectCountry.tr(),
                      style: TextStyle(
                          fontSize: Styles.titleFontSize,
                          fontWeight: Styles.boldText,
                          color: Styles.primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppIcons.cancel,
                        width: 20.h,
                        height: 20.h,
                      ),
                    ),
                  ],
                ),
                DefaultSizedBox.vertical(15),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Map<String, dynamic> country = kCountryList[index];

                      return InkWell(
                        onTap: () {
                          Navigator.pop(context, country);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
                          ),
                          child: Text(
                            country['name'].toString().tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Styles.suvaGrey,
                              fontSize: Styles.regularFontSize,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: kCountryList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
