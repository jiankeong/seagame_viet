import 'package:flutter/material.dart';

import '../styles.dart';
import '../widgets/custom_circular_progress_indicator.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Widget? successWidget;
  final Widget? errorWidget;
  final Future<dynamic>? future;
  final Widget? loadingPlaceHolder;

  CustomFutureBuilder({
    required this.future,
    required this.successWidget,
    this.errorWidget,
    this.loadingPlaceHolder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          if (successWidget != null)
            return successWidget!;
          else
            return Container();
        } else if (snapshot.hasError) {
          if (errorWidget != null)
            return errorWidget!;
          else
            return Center(
              child: Text(
                // 'error'.tr(),
                snapshot.error.toString(),
                style: Styles.errorHintTextStyle,
              ),
            );
        }

        return loadingPlaceHolder ??
            Center(
              child: CustomCircularProgressIndicator(),
            );
      },
    );
  }
}
