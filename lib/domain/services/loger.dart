// ignore_for_file: depend_on_referenced_packages

import 'dart:developer' as dev;

import 'package:logging/logging.dart';

final logger = Logger('');

void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
        (log) {
      dev.log(
        log.message,
        time: log.time,
        sequenceNumber: log.sequenceNumber,
        level: log.level.value,
        name: log.loggerName,
        zone: log.zone,
        error: log.error,
        stackTrace: log.stackTrace,
      );
    },
  );
}