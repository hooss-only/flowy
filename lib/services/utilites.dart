import 'package:intl/intl.dart';

class Utilites {
  static String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(now);
  }
}
