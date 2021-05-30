import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import '../app_strings.dart';
import '../utils/date_format_utils.dart';
import '../widgets/default_divider.dart';
import '../widgets/default_sized_box.dart';

class DefaultDatePicker extends StatelessWidget {
  final DateTime? value;
  final Function(DateTime?)? onDateSelected;
  final bool hasError;
  final double gapHeight;
  final double leftPadding;
  final double rightPadding;

  DefaultDatePicker({
    this.value,
    this.onDateSelected,
    this.hasError = false,
    this.gapHeight = 15,
    this.leftPadding = 0,
    this.rightPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () async {
        final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(
              Duration(days: 365 * 120),
            ),
            lastDate: DateTime.now(),
            builder: (context, child) => Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme:
                        ColorScheme.light(primary: Styles.primaryColor),
                  ),
                  child: child!,
                ));

        if (selectedDate == null) return;

        if (onDateSelected != null) onDateSelected!(selectedDate);
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              leftPadding.w,
              0,
              rightPadding.w,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    value == null
                        ? AppStrings.dateOfBirth.tr().toUpperCase()
                        : DateFormatUtils.ddMMMyyyFormat1(value!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: value == null ? Styles.grey65 : Styles.blackColor,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  size: 18.h,
                  color: Styles.primaryDarkColor,
                )
              ],
            ),
          ),
          DefaultSizedBox.vertical(gapHeight),
          DefaultDivider(
            thickness: 1.2.w,
            color: hasError ? Styles.redColor : null,
          )
        ],
      ),
    );
  }
}
