import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

class LoginResult {
  final bool isSuccess;
  final String error;
  final Jwt jwt;

  LoginResult(this.isSuccess, this.error, this.jwt);
}

@injectable
class LoginUseCase {
  final JwtRepositoryAbstract _jwtRepository;

  LoginUseCase(this._jwtRepository);

  Future<LoginResult> logIn() async {
    try {
      var jwt = await _jwtRepository.login();
      if (jwt != null) {
        return new LoginResult(true, "", jwt);
      } else {
        return new LoginResult(false, "unknown error", null);
      }
    } catch (e) {
      return new LoginResult(false, e.toString(), null);
    }
  }
}
