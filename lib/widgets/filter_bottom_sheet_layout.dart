import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_strings.dart';
import '../icon_image_path.dart';
import 'default_drop_down.dart';
import 'default_button.dart';
import 'default_sized_box.dart';
import 'default_divider.dart';
import '../styles.dart';
import '../constants/app_constants.dart';

class FilterBottomSheetLayout extends StatefulWidget {

  @override
  _FilterBottomSheetLayoutState createState() => _FilterBottomSheetLayoutState();
}

class _FilterBottomSheetLayoutState extends State<FilterBottomSheetLayout> {
  String? _selectedSport;
  String? _selectedDiscipline;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DefaultSizedBox.vertical(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppIcons.cancel,
                  width: 20.h,
                  height: 20.h,
                  color: Colors.transparent,
                ),
                Text(
                  AppStrings.filter.tr(),
                  style: TextStyle(
                    fontSize: Styles.titleFontSize,
                    fontWeight: Styles.boldText,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppIcons.cancel,
                    width: 20.h,
                    height: 20.h,
                  ),
                ),
              ],
            ),
          ),
          DefaultSizedBox.vertical(15),
          DefaultDivider(),
          DefaultSizedBox.vertical(20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              children: [
                DefaultDropdown(
                  hintText: AppStrings.chooseSport.tr(),
                  items: kSportList
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem(
                          value: e['name'],
                          child: Text(
                            e['name'].toString().tr(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedSport = val as String;
                    });
                  },
                ),
                DefaultSizedBox.vertical(20),
                DefaultDropdown(
                  hintText: AppStrings.chooseDiscipline.tr(),
                ),
              ],
            ),
          ),
          DefaultSizedBox.vertical(55),
          DefaultButton(
            width: 213.w,
            buttonText: AppStrings.submit,
            onPressed: () {
              Navigator.pop(context, {
                "sport": _selectedSport,
                "discipline": _selectedDiscipline,
              });
            },
          ),
        ],
      ),
    );
  }
}
