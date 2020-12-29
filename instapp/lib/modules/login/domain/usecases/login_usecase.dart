import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

class LoginResult {
  final bool isSuccess;
  final String error;

  LoginResult(this.isSuccess, this.error);
}

@injectable
class LoginUseCase {
  final JwtRepositoryAbstract _jwtRepository;

  LoginUseCase(this._jwtRepository);

  Future<LoginResult> logIn() async {
    try {
      var jwt = await _jwtRepository.login();
      if (jwt != null) {
        return new LoginResult(true, "");
      } else {
        return new LoginResult(false, "unknown error");
      }
    } catch (e) {
      return new LoginResult(false, e.toString());
    }
  }
}
