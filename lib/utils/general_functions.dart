import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

Future<dynamic> blankFunction() async {
  return true;
}

String formatNumToCurrency(price,
    {int decimalPlaces = 0, bool hasCurrency = false}) {
  String format = '#,##0';

  if (decimalPlaces > 0) {
    format = format + '.';
    for (int i = 0; i < decimalPlaces; i++) {
      format = format + '0';
    }
  }

  String currency = NumberFormat(format, "en_US").format(price);

  if (hasCurrency) {
    currency = 'RM $currency';
  }

  return currency;
}

String formatSingleDigitToDoubleDigit(int value) {
  if (value.toString().length == 1) {
    return '0$value';
  } else {
    return value.toString();
  }
}

launchURL({
  String latitude = '26.1741',
  String longitude = '50.5484',
}) async {
  final String googleMapslocationUrl =
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

  final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

  if (await canLaunch(encodedURl)) {
    await launch(encodedURl);
  } else {
    print('Could not launch $encodedURl');
    throw 'Could not launch $encodedURl';
  }
}

bool canAccessAccrediation(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  bool canAccessAccrediation = userProvider.user != null &&
      (userProvider.user!.userType == 0 ||
          userProvider.user!.userType == 1 ||
          userProvider.user!.userType == 2);

  return canAccessAccrediation;
}
