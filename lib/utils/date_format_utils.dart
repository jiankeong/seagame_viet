import 'package:intl/intl.dart';

class DateFormatUtils {
  ///Format into: 12 Apr 2021
  static String ddMMMyyyFormat1(DateTime date) {
    return DateFormat('dd MMM yyy').format(date);
  }
}