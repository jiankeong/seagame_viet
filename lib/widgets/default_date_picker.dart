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

  DefaultDatePicker({
    this.value,
    this.onDateSelected,
    this.hasError = false,
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
          Row(
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
          DefaultSizedBox.vertical(15),
          DefaultDivider(
            thickness: 1.2.w,
            color: hasError ? Styles.redColor : null,
          )
        ],
      ),
    );
  }
}
