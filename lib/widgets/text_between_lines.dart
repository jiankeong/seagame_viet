import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles.dart';
import '../widgets/default_divider.dart';
import '../widgets/default_sized_box.dart';

class TextBetweenLines extends StatelessWidget {
  final ScreenUtil su = ScreenUtil();
  final String labelText;
  final double margin;
  final double fontSize;
  final bool boldText;

  TextBetweenLines({
    this.labelText = '',
    this.margin = 20,
    this.fontSize = 21,
    this.boldText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: DefaultDivider(
          color: Styles.primaryColor,
        )),
        DefaultSizedBox.horizontal(margin),
        Text(
          labelText,
          style: TextStyle(
            fontSize: 21.sp,
            color: Styles.primaryColor,
            fontWeight: boldText ? Styles.boldText : Styles.regularText,
          ),
        ),
        DefaultSizedBox.horizontal(margin),
        Expanded(
            child: DefaultDivider(
          color: Styles.primaryColor,
        )),
      ],
    );
  }
}
