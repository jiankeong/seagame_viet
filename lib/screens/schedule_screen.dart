import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/default_app_bar.dart';
import '../app_strings.dart';
import '../widgets/schedule/schedule.dart';

class ScheduleScreen extends StatelessWidget {
  static const routeName = '/Schedule';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultAppBar(
            title: AppStrings.schedule.tr(),
          ),
          Expanded(
            child: Schedule(),
          )
        ],
      ),
    );
  }
}
