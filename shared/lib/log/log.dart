abstract class Log {
  // log for debug - not in production, only for debug purpose
  void debug(String message, {List<String> messages = const []});

  // log for event, actions, ...
  void info(String message, {List<String> messages = const []});

  // log for tracking - not in production, should remove all
  void trace(String message, {List<String> messages = const []});

  // log for unexpected value or data, potential lead to bug
  void warning(String message, {List<String> messages = const []});

  // log for try/catch
  void error(String message, {List<String> messages = const []});

  // app crash, freeze, ...
  void fatal(String message, {List<String> messages = const []});
}
