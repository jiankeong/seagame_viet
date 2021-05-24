import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';

class DefaultTextFormField extends StatelessWidget {
  final ScreenUtil su = ScreenUtil();
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDense;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final int minLines;
  final int maxLines;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final Color? hintTextColor;
  final Color? textColor;
  final bool shouldShowVisiblity;
  final Function()? onVisibilityTap;
  final bool enabled;
  final double? hinTextLetterSpacing;
  final Function(String)? onChanged;
  final Color? disableFontColor;
  final String? helperText;

  DefaultTextFormField({
    this.controller,
    this.hintText = '',
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense = false,
    this.topPadding = 12,
    this.bottomPadding = 10,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.minLines = 1,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.textInputFormatter,
    this.hintTextColor,
    this.textColor,
    this.shouldShowVisiblity = false,
    this.onVisibilityTap,
    this.enabled = true,
    this.hinTextLetterSpacing,
    this.onChanged,
    this.disableFontColor,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return enabled
        ? TextFormField(
            controller: controller,
            obscureText: obscureText,
            minLines: minLines,
            maxLines: maxLines,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: textInputType,
            inputFormatters: textInputFormatter ?? [],
            style: TextStyle(
              color: textColor,
              fontSize: 15.sp,
            ),
            onChanged: onChanged == null
                ? (val) {}
                : (val) {
                    onChanged!(val);
                  },
            decoration: InputDecoration(
              hintText: hintText.toUpperCase(),
              helperText: helperText,
              hintStyle: TextStyle(
                color: hintTextColor ?? Styles.grey65,
                fontSize: 15.sp,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                width: 2.w,
                color: Styles.primaryDarkColor,
              )),
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                width: 2.w,
                color: Styles.redColor,
              )),
              prefixIcon: prefixIcon,
              prefixIconConstraints: BoxConstraints(
                minWidth: 2.w,
                minHeight: 2.h,
              ),
              suffixIcon: shouldShowVisiblity
                  ? GestureDetector(
                      onTap: onVisibilityTap == null ? () {} : onVisibilityTap,
                      child: obscureText
                          ? Icon(
                              Icons.visibility_off,
                              color: Styles.grey65,
                              size: 24.h,
                            )
                          : Icon(
                              Icons.visibility,
                              color: Styles.primaryDarkColor,
                              size: 24.h,
                            ),
                    )
                  : suffixIcon,
              contentPadding: EdgeInsets.fromLTRB(
                leftPadding.w,
                topPadding.h,
                rightPadding.w,
                bottomPadding.h,
              ),
              isDense: isDense,
            ),
            validator: validator == null
                ? (value) {
                    return null;
                  }
                : validator!,
          )
        : Text(
            controller == null ? '' : controller!.text,
            style: TextStyle(
              fontSize: Styles.regularFontSize,
              color: disableFontColor == null
                  ? Styles.blackColor
                  : disableFontColor,
            ),
          );
  }
}
