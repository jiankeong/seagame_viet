import 'package:flutter/material.dart';

import '../styles.dart';

class DefaultTabBar extends StatelessWidget {
  final List<Widget>? tabs;
  final Color color;

  DefaultTabBar({
    this.tabs,
    this.color = Styles.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: TabBar(
        indicatorWeight: 3,
        indicatorColor: Styles.whiteColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Styles.whiteColor,
        labelStyle: TextStyle(
          fontWeight: Styles.boldText,
          fontSize: Styles.smallerRegularSize,
        ),
        unselectedLabelColor: Styles.suvaGrey,
        unselectedLabelStyle: TextStyle(
          fontWeight: Styles.boldText,
          fontSize: Styles.smallerRegularSize,
        ),
        tabs: tabs ?? [],
      ),
    );
  }
}
