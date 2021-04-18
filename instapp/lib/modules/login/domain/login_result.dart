import 'package:instapp/modules/login/domain/jwt.dart';

class LoginResult {
  final bool isSuccess;
  final String error;
  final Jwt? jwt;

  LoginResult(this.isSuccess, this.error, this.jwt);
}