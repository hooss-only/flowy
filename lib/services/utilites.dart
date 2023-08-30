import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Utilites {
  /*
  it returns today's date
  eg) 20230825
  */
  static String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(now);
  }

  /*
  it returns today's weekday
  eg) Friday -> 금
  */
  static String getTodayWeekday() {
    initializeDateFormatting();

    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat.E('ko_KR');
    return formatter.format(now);
  }
}
