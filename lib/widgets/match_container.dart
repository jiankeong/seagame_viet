import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './custom_shadow_container.dart';
import './default_cache_network_image.dart';
import '../styles.dart';
import './default_sized_box.dart';
import '../utils/date_format_utils.dart';
import '../models/game_match.dart';

class MatchContainer extends StatelessWidget {
  final GameMatch? match;

  MatchContainer({this.match});

  @override
  Widget build(BuildContext context) {
    return match == null
        ? Container()
        : CustomShadowContainer(
            roundedCorner: false,
            child: Row(
              children: [
                DefaultCacheNetworkImage(
                  imageUrl: match!.image,
                  height: 148.h,
                  width: 148.h,
                ),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        match!.type.toString().toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: Styles.regularFontSize,
                            color: Styles.primaryColor,
                            fontWeight: Styles.boldText),
                      ),
                      DefaultSizedBox.vertical(5),
                      Text(
                        match!.title == null ? "" : match!.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: Styles.regularFontSize,
                            color: Styles.primaryDarkColor),
                      ),
                      DefaultSizedBox.vertical(5),
                      Text(
                        match!.description == null ? "" : match!.description!,
                        style: TextStyle(
                          fontSize: Styles.regularFontSize,
                          color: Styles.primaryDarkColor,
                          fontWeight: Styles.boldText,
                        ),
                      ),
                      DefaultSizedBox.vertical(20),
                      Container(
                        color: Styles.primaryDarkColor,
                        height: 3.h,
                        width: 16.w,
                      ),
                      DefaultSizedBox.vertical(5),
                      Text(
                        match!.location == null ? "" : match!.location!,
                        style: TextStyle(
                          fontSize: Styles.smallerRegularSize,
                          color: Styles.suvaGrey,
                        ),
                      ),
                      DefaultSizedBox.vertical(5),
                      Text(
                        DateFormatUtils.combineStartDateAndEndDate(
                            match!.startDate!, match!.endDate!),
                        style: TextStyle(
                          fontSize: Styles.smallerRegularSize,
                          color: Styles.suvaGrey,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          );
  }
}
