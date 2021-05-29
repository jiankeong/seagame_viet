import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/default_cache_network_image.dart';
import '../globals.dart';
import '../styles.dart';
import '../widgets/default_sized_box.dart';
import '../icon_image_path.dart';
import '../widgets/default_padding.dart';
import '../widgets/country_flag_container.dart';
import '../widgets/sport_sponsor_banner.dart';

class LiveDetailsScreen extends StatelessWidget {
  static const routeName = 'LiveDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: AppStrings.live.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLivePicture(),
                  SportSponsorBanner(),
                  DefaultSizedBox.vertical(25),
                  _buildVersusContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLivePicture() {
    return Stack(
      children: [
        DefaultCacheNetworkImage(
          imageUrl:
              'https://cdn.shopify.com/s/files/1/1238/5608/collections/Aya-OHORI.jpg?v=1579605374',
          width: double.infinity,
          height: Globals().getScreenHeight() * 0.30,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 15.w,
          ),
          color: Styles.redColor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8.h,
                height: 8.h,
                decoration: BoxDecoration(
                  color: Styles.whiteColor,
                  shape: BoxShape.circle,
                ),
              ),
              DefaultSizedBox.horizontal(10),
              Text(
                AppStrings.liveNow.tr().toUpperCase(),
                style: TextStyle(
                    color: Styles.whiteColor,
                    fontWeight: Styles.boldText,
                    fontSize: Styles.smallerRegularSize),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVersusContainer() {
    return DefaultPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WOMEN’S SINGLES SEMIFINALS',
            style: TextStyle(
                fontSize: Styles.regularFontSize,
                color: Styles.primaryDarkColor),
          ),
          DefaultSizedBox.vertical(25),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                CountryFlagContainer(
                  hasShadow: true,
                  width: 58.w,
                  height: 38.h,
                  countryFlag: AppImages.indonesia,
                ),
                DefaultSizedBox.vertical(15),
                Text(
                  'C. Jonatan',
                  style: TextStyle(
                    fontSize: Styles.regularFontSize,
                    color: Styles.primaryDarkColor,
                  ),
                ),
              ],
            ),
            DefaultSizedBox.horizontal(15),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'INA',
                    style: TextStyle(
                      fontSize: Styles.regularFontSize,
                      color: Styles.primaryDarkColor,
                      fontWeight: Styles.boldText,
                    ),
                  ),
                  DefaultSizedBox.horizontal(15),
                  Text(
                    'VS',
                    style: TextStyle(
                      fontSize: Styles.regularFontSize,
                      color: Styles.primaryColor,
                      fontWeight: Styles.boldText,
                    ),
                  ),
                  DefaultSizedBox.horizontal(15),
                  Text(
                    'MAS',
                    style: TextStyle(
                      fontSize: Styles.regularFontSize,
                      color: Styles.primaryDarkColor,
                      fontWeight: Styles.boldText,
                    ),
                  ),
                ],
              ),
            ),
            DefaultSizedBox.horizontal(15),
            Column(
              children: [
                CountryFlagContainer(
                  hasShadow: true,
                  width: 58.w,
                  height: 38.h,
                  countryFlag: AppImages.malaysia,
                ),
                DefaultSizedBox.vertical(15),
                Text(
                  'C.W. Lee',
                  style: TextStyle(
                    fontSize: Styles.regularFontSize,
                    color: Styles.primaryDarkColor,
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
