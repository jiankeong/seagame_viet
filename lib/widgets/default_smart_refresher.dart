import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/common_pull_load_footer.dart';

class DefaultSmartRefresher extends StatelessWidget {
  final RefreshController controller;
  final bool enablePullDown;
  final bool enablePullUp;
  final Function()? onRefresh;
  final Function()? onLoading;
  final Widget child;
  final ScrollPhysics? scrollPhysics;

  DefaultSmartRefresher({
    required this.controller,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.onRefresh,
    this.onLoading,
    required this.child,
    this.scrollPhysics,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      enablePullUp: enablePullUp,
      enablePullDown: enablePullDown,
      physics: scrollPhysics,
      onLoading: onLoading ?? null,
      onRefresh: onRefresh ?? null,
      footer: CommonPullLoadFooter(),
      child: child,
    );
  }
}
