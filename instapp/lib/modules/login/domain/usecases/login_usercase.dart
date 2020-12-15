import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/repository/auth_repository.dart';

@injectable
class LoginUserCase {
  final AuthRepository _authRepository;

  LoginUserCase(this._authRepository);

  Future<bool> logIn(String email, String password) {
    // TODO: authRepository should return token
    // save token in cache
    // if login failed, catch exception and return false
    return _authRepository.logIn(email, password);
  }
}
