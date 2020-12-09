import 'package:flutter/material.dart';
import 'package:instapp/config/di/di.dart';
import 'app.dart';

Future<void> main() async {
  await configureInjection();
  App app = getIt<App>();

  runApp(app);
}
