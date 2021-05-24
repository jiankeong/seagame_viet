import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_pickers/country.dart';

import './country_picker_dialog_layout.dart';
import '../../app_strings.dart';
import '../../styles.dart';
import '../default_sized_box.dart';
import '../default_divider.dart';

class CountryPicker extends StatelessWidget {
  final String? value;
  final Function(Country) onValueChanged;
  final bool isPhoneCode;
  final bool hasError;

  CountryPicker({
    this.value,
    required this.onValueChanged,
    this.hasError = false,
  }) : isPhoneCode = false;

  CountryPicker.phoneCode({
    this.value,
    required this.onValueChanged,
    this.hasError = false,
  }) : isPhoneCode = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context) => Material(
                  color: Colors.transparent,
                  child: Theme(
                    data: Theme.of(context).copyWith(),
                    child: CountryPickerDialogLayout(
                      onValueChanged: onValueChanged,
                    ),
                  ),
                ));
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  value == null
                      ? (isPhoneCode
                              ? AppStrings.countryCode
                              : AppStrings.yourCountry)
                          .tr()
                          .toUpperCase()
                      : value!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: value == null ? Styles.grey65 : Styles.blackColor,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 24.h,
                color: Styles.primaryDarkColor,
              )
            ],
          ),
          DefaultSizedBox.vertical(12),
          DefaultDivider(
            thickness: 1.2.w,
            color: hasError ? Styles.redColor : null,
          )
        ],
      ),
    );
  }
}
