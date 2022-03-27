import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';

/// A convenience mixin to expose a [Logger] instance for classes named after
/// their type.
mixin FootballLogger {
  Logger get log => Logger('$runtimeType');
}

/// Adds a listener to the top-level root logger.
///
/// Clients can call the [Logger] singleton constructor to log messages or use
/// [Logger.detached] to create local short-living logger that can be
/// garbage-collected later.
void initializeLogger({String? prefix}) {
  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen((rec) {
    if (rec.error != null) {
      if (rec.error is Response) {
      } else {}

      if (rec.stackTrace != null) {
        rec.stackTrace.toString().trim().split('\n').forEach(debugPrint);
      }
    }
  });
}
