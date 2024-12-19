import 'package:logger/logger.dart' as lib_logger;

import '../../config/logger_defaults.dart';

// coverage:ignore-start
/// A mixin class that provides a logger instance.

mixin class Logger {
  /// Expose the Level enum as a getter
  static const logLevels = LogLevels();

  static final _myPrinter = lib_logger.PrettyPrinter(
    methodCount: 0,
    printEmojis: false,
    dateTimeFormat: lib_logger.DateTimeFormat.none,
  );

  /// The logger instance.
  static lib_logger.Logger log = lib_logger.Logger(
    printer: _myPrinter,
    level: defaultLogLevel,
    output: myConsoleOutput(),
  );

  /// Set the log level of the logger.
  static void setLogLevel(lib_logger.Level level) {
    /// override the logger
    log = lib_logger.Logger(
      printer: _myPrinter,
      level: level,
      output: myConsoleOutput(),
    );
  }
}

/// A class that provides log levels.
class LogLevels {
  ///
  const LogLevels();

  /// [Level] all - log everything
  lib_logger.Level get all => lib_logger.Level.all;

  /// [Level] trace - log everything
  lib_logger.Level get trace => lib_logger.Level.trace;

  /// [Level] debug - log debug and above
  lib_logger.Level get debug => lib_logger.Level.debug;

  /// [Level] info - log info and above
  lib_logger.Level get info => lib_logger.Level.info;

  /// [Level] warning - log warning and above
  lib_logger.Level get warning => lib_logger.Level.warning;

  /// [Level] error - log error and above
  lib_logger.Level get error => lib_logger.Level.error;

  /// [Level] fatal - log fatal and above
  lib_logger.Level get fatal => lib_logger.Level.fatal;

  /// [Level] off - log nothing
  lib_logger.Level get off => lib_logger.Level.off;
}

/// custom console output, includes NDK prefix
class myConsoleOutput extends lib_logger.LogOutput {
  @override
  void output(lib_logger.OutputEvent event) {
    event.lines.forEach(
      /// add prefix in each line
      (line) => print("NDK: " + line),
    );
  }
}
// coverage:ignore-end
