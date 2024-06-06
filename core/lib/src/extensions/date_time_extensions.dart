extension DateTimeExtensions on DateTime {
  String generateTimestamp() {
    return DateTime.now().millisecond.toString();
  }
}
