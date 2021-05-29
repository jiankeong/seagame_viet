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

  ///Format into time
  static String hmFormat(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  static String combineStartDateAndEndDate(DateTime startDate, DateTime endDate) {
    String dateAndDay = ddMMMEEE(startDate);
    String startTime = hmFormat(startDate);
    String endTime = hmFormat(endDate);

    return '$dateAndDay | $startTime - $endTime';
  }

  static String dateWithTime(DateTime date) {
    return DateFormat('dd MMM yyy | hh:mm').format(date);
  }
}
