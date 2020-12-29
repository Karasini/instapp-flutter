import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/Infrastructure/jwt_repository.dart';
import 'package:instapp/modules/login/domain/jwt.dart';

@injectable
class RefreshJwtUserCase {
  final JwtRepository _jwtRepository;
  RefreshJwtUserCase(this._jwtRepository);

  Future<Jwt> refreshJwt() async {
    final jwt = await _jwtRepository.getJwt();
    if (jwt == null) return null;

    return await _jwtRepository.refreshToken(jwt);
  }
}
