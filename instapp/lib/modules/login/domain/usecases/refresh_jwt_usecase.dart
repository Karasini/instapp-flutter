import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

@injectable
class RefreshJwtUserCase {
  final JwtRepositoryAbstract _jwtRepository;
  RefreshJwtUserCase(this._jwtRepository);

  Future<Jwt> refreshJwt() async {
    Jwt jwt = await _jwtRepository.getJwt();
    if (jwt == null) return null;
    try {
      jwt = await _jwtRepository.refreshToken(jwt);
    } catch (_) {
    }
    return jwt;
  }
}
