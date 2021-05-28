import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../icon_image_path.dart';
import 'default_padding.dart';
import 'custom_shadow_container.dart';
import '../styles.dart';
import 'default_text_form_field.dart';
import '../app_strings.dart';

class SearchContainerWithBanner extends StatelessWidget {
  final String hintText;

  SearchContainerWithBanner({
    this.hintText = AppStrings.searchTeams,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.teamExploreBanner),
        ),
      ),
      child: DefaultPadding(
        child: CustomShadowContainer(
          leftPadding: 18,
          borderRadius: BorderRadius.circular(10.h),
          child: DefaultTextFormField(
            topPadding: 0,
            bottomPadding: 0,
            hideBorder: true,
            hintText: hintText.tr(),
            textAlign: TextAlign.center,
            hintStyle: TextStyle(
              color: Styles.primaryColor,
              fontWeight: Styles.boldText,
            ),
            suffixIcon: Icon(
              Icons.search,
              size: 24.h,
              color: Styles.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
