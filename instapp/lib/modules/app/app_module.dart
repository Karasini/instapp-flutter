import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:instapp/config/di/di.dart';

class AppModule {
  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureInjection();
    await GlobalConfiguration().loadFromAsset("app_settings");
  }
}