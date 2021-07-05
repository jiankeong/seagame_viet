import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'custom_future_builder.dart';
import '../utils/general_functions.dart';
import '../globals.dart';
import '../styles.dart';
import '../app_strings.dart';
import '../icon_image_path.dart';
import './default_sized_box.dart';
import './no_records_found_text.dart';

class TermsOrPrivacyDialog extends StatefulWidget {
  final int type;

  TermsOrPrivacyDialog({this.type = 0});

  @override
  _TermsOrPrivacyDialogState createState() => _TermsOrPrivacyDialogState();
}

class _TermsOrPrivacyDialogState extends State<TermsOrPrivacyDialog> {
  bool isInit = true;

  String infoText = "";

  Future<dynamic> _getInfoText() async {
    isInit = false;

    await Future.delayed(Duration(seconds: 1));

    if (widget.type == 1) {
      infoText = """""";
    } else {
      infoText = """""";
    }

    if (!mounted) return;

    setState(() {});

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Globals().getScreenWidth() * 0.05,
          vertical: Globals().getScreenHeight() * 0.1),
      child: Container(
        decoration: BoxDecoration(
          color: Styles.whiteColor,
          borderRadius: BorderRadius.circular(15.h),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 25.h,
          horizontal: 25.h,
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitleSection(),
              DefaultSizedBox.vertical(15),
              Expanded(
                child: CustomFutureBuilder(
                  future: isInit ? _getInfoText() : blankFunction(),
                  successWidget: infoText.trim() == ""
                      ? Center(
                          child: NoRecordFoundText(),
                        )
                      : SingleChildScrollView(
                          child: Html(
                            data: infoText,
                            style: {
                              "p": Style(
                                fontSize: FontSize(14.sp),
                                textAlign: TextAlign.justify,
                              )
                            },
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            titleMapper().tr().toUpperCase(),
            style: TextStyle(
              fontWeight: Styles.boldText,
              fontSize: 23.sp,
              color: Styles.primaryColor,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AppIcons.cancel,
            width: 24.h,
            height: 24.h,
          ),
        ),
      ],
    );
  }

  String titleMapper() {
    switch (widget.type) {
      case 1:
        return AppStrings.privacyStatement;
      default:
        return AppStrings.termsOfUse;
    }
  }
}
