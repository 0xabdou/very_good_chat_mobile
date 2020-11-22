import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// GetIt singleton
final getIt = GetIt.instance;

/// Configures dependency injection
@injectableInit
Future<void> configureInjection(String env) async {
  await $initGetIt(getIt, environment: env);
}
