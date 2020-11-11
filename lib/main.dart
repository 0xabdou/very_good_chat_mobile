import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_chat/shared/injection.dart';

import 'presentation/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.test);
  runApp(AppWidget());
}
