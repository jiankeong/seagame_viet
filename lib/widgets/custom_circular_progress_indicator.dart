import 'package:flutter/material.dart';

import '../styles.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color color;

  CustomCircularProgressIndicator({
    this.color = Styles.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
