import 'package:intl/intl.dart';

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
