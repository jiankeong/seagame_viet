import 'package:flutter/material.dart';

import '../styles.dart';
import './default_sized_box.dart';

class InfoVerticalLayout extends StatelessWidget {
  final String? title;
  final String? value;

  InfoVerticalLayout({this.title = '', this.value = '0'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: Styles.regularFontSize,
            color: Styles.suvaGrey,
          ),
        ),
        DefaultSizedBox.vertical(10),
        Text(
          value == null ? '-' : '$value',
          style: TextStyle(
            fontSize: Styles.titleFontSize,
            fontWeight: Styles.boldText,
          ),
        ),
      ],
    );
  }
}
