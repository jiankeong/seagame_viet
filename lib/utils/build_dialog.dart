import 'package:flutter/material.dart';

import '../widgets/term_or_privacy_dialog.dart';

Future<dynamic> buildTermsOrPrivacyDialog(
  BuildContext context, {

  ///0: terms, 1: Privacy
  int type = 0,
}) async {
  return showDialog(
    context: context,
    builder: (context) => TermsOrPrivacyDialog(
      type: type,
    ),
  );
}
