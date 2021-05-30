import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class DefaultDropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final Function(Object?)? onChanged;
  final String? hintText;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final bool isDense;
  final bool enabled;
  final bool isExpanded;
  final bool hideBorder;
  final String? Function(String?)? validator;

  DefaultDropdown({
    this.items,
    this.value,
    this.onChanged,
    this.hintText,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.isDense = true,
    this.enabled = true,
    this.isExpanded = true,
    this.hideBorder = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return enabled
        ? DropdownButtonFormField<String>(
            isExpanded: isExpanded,
            isDense: isDense,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            itemHeight: 74.h,
            style: TextStyle(
              fontSize: Styles.smallerTitleFontSize,
              color: Styles.blackColor,
            ),
            hint: hintText == null
                ? null
                : Text(
                    hintText!.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Styles.regularFontSize,
                      color: Styles.grey65,
                    ),
                  ),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: Styles.smallerRegularSize,),
                enabledBorder: hideBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0.w,
                          color: Styles.grey65,
                        ),
                      ),
                contentPadding: EdgeInsets.fromLTRB(
                  leftPadding.w,
                  topPadding.h,
                  rightPadding.w,
                  bottomPadding.h
                )),
            value: value,
            items: items ?? [],
            onChanged: onChanged == null ? (val) {} : onChanged,
            validator: validator == null
                ? (value) {
                    return null;
                  }
                : validator!,
          )
        : Text(
            value ?? '',
            style: TextStyle(
              fontSize: Styles.regularFontSize,
            ),
          );
  }
}
