import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../styles.dart';
import '../app_strings.dart';

class NoRecordFoundText extends StatelessWidget {
  const NoRecordFoundText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.noRecordsFound.tr(),
      style: Styles.errorHintTextStyle,
    );
  }
}
