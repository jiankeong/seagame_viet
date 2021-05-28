import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../styles.dart';

class MedalTallyTableTitle extends StatelessWidget {
  final String title;
  final bool alignCenter;

  MedalTallyTableTitle({
    this.title = '',
    this.alignCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr(),
      textAlign: alignCenter ? TextAlign.center : null,
      style: TextStyle(
        color: Styles.whiteColor,
        fontSize: Styles.smallerRegularSize,
      ),
    );
  }
}