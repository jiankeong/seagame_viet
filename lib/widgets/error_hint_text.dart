import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_strings.dart';
import '../widgets/default_sized_box.dart';
import '../styles.dart';

class ErrorHintText extends StatelessWidget {
  final String text;

  ErrorHintText({this.text = AppStrings.emptyInputError});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultSizedBox.vertical(6),
        Text(
          text.tr(),
          style: TextStyle(
            fontSize: Styles.smallerRegularSize,
            color: Styles.redColor,
          ),
        ),
      ],
    );
  }
}
