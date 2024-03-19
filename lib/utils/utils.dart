import 'package:intl/intl.dart';

class Utils {
  static String getDayOfWeek(DateTime dateTime) {
    DateFormat formatter = DateFormat('EEEE');
    String weekDayEn = formatter.format(dateTime);
    String weekDayCN;
    switch (weekDayEn.toLowerCase()) {
      case "monday":
        weekDayCN = "星期一";
        break;
      case "tuesday":
        weekDayCN = "星期二";
        break;
      case "wednesday":
        weekDayCN = "星期三";
        break;
      case "thursday":
        weekDayCN = "星期四";
        break;
      case "friday":
        weekDayCN = "星期五";
        break;
      case "saturday":
        weekDayCN = "星期六";
        break;
      case "sunday":
        weekDayCN = "星期日";
        break;
      default:
        weekDayCN = "星期一";
        break;
    }
    return weekDayCN;
  }

  static String getFormattedTime(DateTime dateTime) {
    DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  static String getFormattedDate(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  static int getFormattedYear(DateTime dateTime) {
    return dateTime.year;
  }

  static int getFormattedMonth(DateTime dateTime) {
    return dateTime.month;
  }

  static int getFormattedDay(DateTime dateTime) {
    return dateTime.day;
  }

  static int getFormattedHour(DateTime dateTime) {
    return dateTime.hour;
  }

  static int getFormattedMinute(DateTime dateTime) {
    return dateTime.minute;
  }
}
