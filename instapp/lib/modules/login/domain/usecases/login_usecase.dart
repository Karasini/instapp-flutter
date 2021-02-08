import 'package:injectable/injectable.dart';
import 'package:instapp/modules/app/app_logger.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/login_result.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

@injectable
class LoginUseCase {
  final JwtRepositoryAbstract _jwtRepository;

  LoginUseCase(this._jwtRepository);

  Future<LoginResult> logIn() async {
    try {
      var jwt = await _jwtRepository.login();
      return jwt != null
          ? new LoginResult(true, "", jwt)
          : new LoginResult(false, "unknown error", null);
    } catch (e) {
      logger.d(e);
      return new LoginResult(false, e.toString(), null);
    }
  }
}
