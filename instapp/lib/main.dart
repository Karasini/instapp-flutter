import 'package:flutter/material.dart';
import 'package:instapp/config/di/di.dart';
import 'package:instapp/modules/app/app_module.dart';
import 'app.dart';

Future<void> main() async {
  await AppModule.initApp();

  App app = getIt<App>();
  runApp(app);
}
