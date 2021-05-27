import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './custom_shadow_container.dart';
import './default_text_form_field.dart';
import '../styles.dart';

class SearchContainer extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final double leftPadding;
  final double rightPadding;

  SearchContainer({
    this.hintText = '',
    this.borderRadius = 5,
    this.leftPadding = 20,
    this.rightPadding = 5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      leftPadding: leftPadding,
      rightPadding: rightPadding,
      topPadding: 0,
      bottomPadding: 0,
      borderRadius: BorderRadius.circular(borderRadius.h),
      child: DefaultTextFormField(
        topPadding: 0,
        bottomPadding: 0,
        hideBorder: true,
        hintText: hintText,
        suffixIcon: Icon(
          Icons.search,
          size: 24.h,
          color: Styles.primaryColor,
        ),
      ),
    );
  }
}
