import 'package:flutter/material.dart';

import '../styles.dart';

class TextPressable extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final double? fontSize;

  TextPressable({
    this.label = '',
    this.onPressed,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize ?? Styles.smallerRegularSize,
          color: Styles.primaryDarkColor,
          fontWeight: Styles.boldText,
        ),
      ),
    );
  }
}