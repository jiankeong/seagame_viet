import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String latitude = '21.0205',
  String longitude = '105.7631',
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
