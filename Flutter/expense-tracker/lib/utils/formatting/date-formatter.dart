import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class DateFormatter {
  static String formatDate(DateTime date) {
    return formatter.format(date);
  }
}
