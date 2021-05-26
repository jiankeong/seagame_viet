import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class DefaultRatingBar extends StatelessWidget {
  final double initalRating;
  final double itemSize;
  final bool ignoreGesture;
  final double horizontalPadding;
  final Color iconColor;

  DefaultRatingBar({
    this.initalRating = 0,
    this.itemSize = 15,
    this.ignoreGesture = true,
    this.horizontalPadding = 3,
    this.iconColor = Styles.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initalRating,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: itemSize.h,
      ignoreGestures: true,
      itemPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w,
      ),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: iconColor,
      ),
      onRatingUpdate: (selectedRating) {},
    );
  }
}
