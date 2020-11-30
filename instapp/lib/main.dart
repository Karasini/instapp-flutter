import 'package:flutter/material.dart';
import 'package:instapp/config/di/di.dart';
import 'app.dart';
import 'package:login/config/di/di.dart';

Future<void> main() async {
  await configureLoginModuleInjection();
  await configureInjection();
  App app = getIt<App>();

  runApp(app);
}
