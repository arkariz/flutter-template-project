import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

class LoggerUtil {
  static Logger getLogger(String className) => Logger(
    printer: PrefixPrinter(
      _LogPrinterUtil(
        className: className,
        colors: false,
      ),
    ),
  );
}

class _LogPrinterUtil extends LogPrinter {
  final String? _className;
  final bool colors;

  _LogPrinterUtil({
    String? className,
    this.colors = true,
  }) : _className = className;

  static final levelColors = {
    Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: const AnsiColor.none(),
    Level.info: const AnsiColor.fg(12),
    Level.warning: const AnsiColor.fg(208),
    Level.error: const AnsiColor.fg(196),
    Level.fatal: const AnsiColor.fg(199),
  };

  static final levelEmojis = {
    Level.trace: 'ℹ ',
    Level.debug: '🐛 ',
    Level.info: '💡 ',
    Level.warning: '⚠️ ',
    Level.error: '⛔ ',
    Level.fatal: '👾 ',
  };

  @override
  List<String> log(LogEvent event) {
    var messageStr = _stringifyMessage(event.message);
    var errorStr = event.error != null ? '  ERROR: ${event.error}' : '';
    return ['${_labelFor(event.level)} [${kReleaseMode ?'':_className}] - ${kReleaseMode ? '': '$messageStr$errorStr'}'];
  }

  String? _labelFor(Level level) {
    var color = levelColors[level];
    var emoji = levelEmojis[level];

    return colors ? color!(emoji!) : emoji;
  }

  String _stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = const JsonEncoder.withIndent(null);
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }
}