import 'package:flutter/material.dart';

class DefaultTab extends StatelessWidget {
  final Widget? child;

  DefaultTab({this.child});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: child,
    );
  }
}
