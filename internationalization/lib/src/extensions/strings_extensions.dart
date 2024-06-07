import 'package:intl/intl.dart';

extension StringsExtensions on String {
  String convertDate() {
    try {
      const dateFormat = 'MM/dd/yyyy';
      final dateTime = DateTime.parse(this);
      return DateFormat(dateFormat).format(dateTime);
    } catch (e) {
      return '';
    }
  }
}
