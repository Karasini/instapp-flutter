import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  FlutterSecureStorage get flutterSecureStorage;

  @singleton
  FlutterAppAuth get flutterAppAuth;
}