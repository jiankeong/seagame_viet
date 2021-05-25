import 'package:flutter/material.dart';

import '../styles.dart';
import './default_sized_box.dart';

class LabelValueVerticalLayout extends StatelessWidget {
  final String? label;
  final String? value;
  final int maxLines;

  LabelValueVerticalLayout({
    this.label = '',
    this.value = '',
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: TextStyle(
            fontSize: Styles.regularFontSize,
            color: Styles.suvaGrey,
          ),
        ),
        DefaultSizedBox.vertical(5),
        FittedBox(
          child: Text(
            value!,
            maxLines: maxLines,
            style: TextStyle(
              fontSize: Styles.smallerTitleFontSize,
              color: Styles.primaryDarkColor,
            ),
          ),
        )
      ],
    );
  }
}