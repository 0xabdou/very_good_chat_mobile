import 'package:logger/logger.dart';

/// Logger singleton
final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
  ),
);
