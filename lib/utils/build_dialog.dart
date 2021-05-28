import 'package:flutter/material.dart';

import '../widgets/term_or_privacy_dialog.dart';
import '../widgets/select_country_dialog_layout.dart';
import '../widgets/competition/competition_result_dialog.dart';

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

Future<dynamic> buildSelectCountryDialog(
  BuildContext context,
) async {
  return await showDialog(
    context: context,
    builder: (context) => SelectCountryDialogLayout(),
  );
}

Future<dynamic> buildCompetitionResultDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => Center(child: CompetitionResultDialog()),
  );
}
