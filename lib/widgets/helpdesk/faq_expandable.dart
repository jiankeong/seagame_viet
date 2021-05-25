import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles.dart';
import '../../screens/helpdesk_screen.dart';
import '../../globals.dart';

class FAQExpandable extends StatelessWidget {
  final FAQ? faq;

  FAQExpandable({this.faq});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Styles.whiteColor,
          borderRadius: BorderRadius.circular(10.h),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1.5),
              color: Styles.blackColor.withOpacity(0.1),
              spreadRadius: 0.2,
              blurRadius: 5,
            ),
          ],
        ),
        child: ExpandablePanel(
          theme: ExpandableThemeData(hasIcon: true, tapBodyToCollapse: true),
          header: Padding(
            padding: EdgeInsets.fromLTRB(
              15.w,
              Globals().getScreenHeight() < 550
                  ? 20.h
                  : Globals().getScreenHeight() < 900
                      ? Globals().getScreenHeight() < 600
                          ? 18.h
                          : 11.h
                      : Globals().getScreenHeight() < 1100
                          ? 8.h
                          : 4.h,
              0.0,
              0.0,
            ),
            child: Text(
              faq!.question!,
              style: TextStyle(
                fontSize: Styles.smallerTitleFontSize,
                fontWeight: Styles.boldText,
              ),
            ),
          ),
          collapsed: Container(),
          expanded: Padding(
            padding: EdgeInsets.fromLTRB(
              15.w,
              0.0.h,
              15.w,
              15.0.h,
            ),
            child: Text(
              faq!.answer!,
              style: TextStyle(
                color: Styles.suvaGrey,
                fontSize: Styles.regularFontSize,
              ),
            ),
          ),
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(
                crossFadePoint: 0,
                tapBodyToCollapse: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
