import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger(
  level: kReleaseMode ? Level.off : Level.debug,
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
  ),
);

extension LogExt on Object {
  void logD({String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.d(_withTag(tag), error: error, stackTrace: stackTrace);
  }

  void logI({String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.i(_withTag(tag), error: error, stackTrace: stackTrace);
  }

  void logW({String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.w(_withTag(tag), error: error, stackTrace: stackTrace);
  }

  void logE({String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.e(_withTag(tag), error: error, stackTrace: stackTrace);
  }

  String _withTag(String? tag) {
    return tag != null ? '[$tag] $this' : toString();
  }
}
