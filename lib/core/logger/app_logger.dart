import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;

  final _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
      methodCount: 0,
      dateTimeFormat: (time) => '[${time.hour}:${time.minute}:${time.second}]',
    ),
  );
  final bool kReleaseMode = false;
  AppLogger._internal();

  void debug(String message) {
    if (!kReleaseMode) {
      _logger.d(message);
    }
  }

  void error(String message) {
    if (!kReleaseMode) {
      _logger.e(message);
    }
  }

  void info(String message) {
    if (!kReleaseMode) {
      _logger.i(message);
    }
  }

  void warrning(String message) {
    if (!kReleaseMode) {
      _logger.w(message);
    }
  }
}
