import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';

import '../default_sized_box.dart';
import '../../globals.dart';
import '../../styles.dart';
import '../../icon_image_path.dart';
import '../../app_strings.dart';

class CountryPickerDialogLayout extends StatelessWidget {
  final Function(Country) onValueChanged;

  CountryPickerDialogLayout({
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultSizedBox.vertical(25),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
              right: Globals().getScreenWidth() * 0.115,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AppIcons.cancel,
                  width: 20.h,
                  height: 20.h,
                  fit: BoxFit.cover,
                  color: Styles.whiteColor),
            ),
          ),
        ),
        SizedBox(
          height: Globals().getScreenHeight() * 0.85,
          child: CountryPickerDialog(
              titlePadding: EdgeInsets.all(0.0),
              searchInputDecoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    width: 2.w,
                    color: Styles.primaryColor,
                  )),
                  hintText: AppStrings.search.tr(),
                  hintStyle: TextStyle(
                    fontSize: Styles.titleFontSize,
                    color: Styles.grey65,
                  )),
              isSearchable: true,
              onValuePicked: onValueChanged,
              itemBuilder: (Country country) => Container(
                    child: Text(
                      "${country.name} (+${country.phoneCode})",
                      style: TextStyle(
                        fontSize: Styles.regularFontSize,
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
