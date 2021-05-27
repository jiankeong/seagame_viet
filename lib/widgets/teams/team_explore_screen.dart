import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../default_text_form_field.dart';
import '../custom_shadow_container.dart';
import '../../icon_image_path.dart';
import '../../app_strings.dart';
import '../../globals.dart';
import '../default_padding.dart';
import '../../styles.dart';
import '../default_sized_box.dart';
import '../country_list.dart';

class TeamExploreScreen extends StatefulWidget {
  @override
  _TeamExploreScreenState createState() => _TeamExploreScreenState();
}

class _TeamExploreScreenState extends State<TeamExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              decoration: BoxDecoration(
                image: DecorationImage(
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
                    hintText: AppStrings.searchTeams.tr(),
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
            ),
            CountryList(
              onPressed: (Map<String, dynamic>? country) {},
            ),
          ],
        ),
      ),
    );
  }
}
