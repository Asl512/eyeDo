import 'package:intl/intl.dart';

String convertDate({
  required DateTime? date,
  bool withTime = false,
}) {
  if (date != null) {
    if (withTime) return DateFormat('dd.MM.yyyy hh:mm').format(date);
    return DateFormat('dd.MM.yyyy').format(date);
  } else {
    return '';
  }
}
