import 'package:intl/intl.dart';

class DateFormatUtils {
  ///Format into: 12 Apr 2021
  static String ddMMMyyyFormat1(DateTime date) {
    return DateFormat('dd MMM yyy').format(date);
  }

  ///Format into: April 21, 2021
  static String monthDateYear(DateTime date) {
    return DateFormat('MMMM dd, yyy').format(date);
  }

  static String ddMMMEEE(DateTime date) {
    return DateFormat('dd MMM (EEE)').format(date);
  }
}
