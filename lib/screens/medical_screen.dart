import 'package:flutter/material.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../icon_image_path.dart';
import '../styles.dart';
import '../widgets/custom_shadow_container.dart';
import '../globals.dart';
import '../app_strings.dart';
import '../widgets/default_padding.dart';
import '../widgets/default_sized_box.dart';

class MedicalScreen extends StatefulWidget {
  static const routeName = '/Medical';

  @override
  _MedicalScreenState createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.medicalBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          ExpandableBottomSheet(
            key: key,
            background: Container(
              color: Colors.transparent,
            ),
            persistentHeader: InkWell(
              onTap: () {
                if (key.currentState!.expansionStatus ==
                    ExpansionStatus.expanded) {
                  key.currentState!.contract();
                  setState(() {});
                  return;
                }

                key.currentState!.expand();

                setState(() {});
              },
              child: CustomShadowContainer(
                height: Globals().getScreenHeight() * 0.18,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.h),
                  topRight: Radius.circular(15.h),
                ),
                child: DefaultPadding(
                  top: 20,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              AppIcons.back,
                              width: 25.h,
                              height: 25.h,
                              fit: BoxFit.contain,
                              color: Styles.blackColor,
                            ),
                          ),
                          Text(
                            AppStrings.closestMedicalHelp.tr(),
                            style: TextStyle(
                                fontSize: 21.sp,
                                fontWeight: Styles.boldText,
                                color: Styles.primaryColor),
                          ),
                          Image.asset(
                            AppIcons.back,
                            width: 25.h,
                            height: 25.h,
                            fit: BoxFit.contain,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                      DefaultSizedBox.vertical(20),
                      MedicalCenter(
                        centerName: 'Behn Vien The Thao',
                        distance: '4.5 KM',
                        status: key.currentState == null
                            ? null
                            : key.currentState!.expansionStatus,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            expandableContent: Container(
              constraints:
                  BoxConstraints(maxHeight: Globals().getScreenHeight() * 0.5),
              color: Styles.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

class MedicalCenter extends StatelessWidget {
  final ExpansionStatus? status;
  final String centerName;
  final String distance;

  MedicalCenter({
    this.status = ExpansionStatus.contracted,
    this.centerName = '',
    this.distance = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 0.2,
                      offset: Offset(0, 1),
                      color: Styles.blackColor.withOpacity(0.3),
                    ),
                  ]),
              child: Text(
                'H',
                style: TextStyle(
                  color: Styles.whiteColor,
                  fontSize: 23.sp,
                  fontWeight: Styles.boldText,
                ),
              ),
            ),
            DefaultSizedBox.horizontal(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  centerName,
                  style: TextStyle(
                      color: Styles.primaryColor,
                      fontSize: Styles.titleFontSize,
                      fontWeight: Styles.boldText),
                ),
                DefaultSizedBox.vertical(10),
                Text(
                  distance,
                  style: TextStyle(
                      color: Styles.primaryDarkColor,
                      fontSize: Styles.regularFontSize,
                      fontWeight: Styles.boldText),
                ),
              ],
            ),
          ],
        ),
        if (status != null && status == ExpansionStatus.contracted)
          Image.asset(
            AppIcons.forward,
            width: 25.h,
            height: 25.h,
          )
      ],
    );
  }
}
