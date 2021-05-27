import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import './custom_circular_progress_indicator.dart';
import '../app_strings.dart';

class CommonPullLoadFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (context, mode) {
        Widget? body;
        if (mode == LoadStatus.idle) {
          body = Text(
            AppStrings.endOfList.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Styles.suvaGrey,
              fontSize: Styles.regularFontSize,
              fontWeight: Styles.boldText,
            ),
          );
        } else if (mode == LoadStatus.loading) {
          body = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: CustomCircularProgressIndicator(),
                width: 30.h,
                height: 30.h,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                AppStrings.loading.tr(),
                style: TextStyle(
                  color: Styles.suvaGrey,
                  fontSize: Styles.regularFontSize,
                ),
              ),
            ],
          );
        } else if (mode == LoadStatus.failed) {
          body = Text(
            AppStrings.loadFailed.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Styles.redColor,
              fontSize: Styles.smallerTitleFontSize,
            ),
          );
        } else if (mode == LoadStatus.canLoading) {
          body = Text(
            AppStrings.releaseToLoadMore.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Styles.suvaGrey,
              fontSize: Styles.smallerTitleFontSize,
            ),
          );
        } else {
          body = Text(
            AppStrings.noMoreData.tr(),
            style: TextStyle(
              fontSize: Styles.regularFontSize
            ),
          );
        }

        return Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: 6.5.sp,
            ),
            child: body,
          ),
        );
      },
    );
  }
}
