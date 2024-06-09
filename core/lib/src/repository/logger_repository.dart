abstract interface class LoggerRepository {
  void d(String message);

  void e(String message, [Object? error, StackTrace? stackTrace]);
}
