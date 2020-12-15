import 'package:flutter/widgets.dart';
import 'package:instapp/modules/login/domain/repository/auth_repository.dart';

class LoginPageArguments {
  final AuthRepository authRepository;
  final Key key;
  // you're not going to lose your default values;
  LoginPageArguments({this.key, this.authRepository});
}