import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

@injectable
class RefreshJwtUserCase {
  final JwtRepositoryAbstract _jwtRepository;
  RefreshJwtUserCase(this._jwtRepository);

  Future<Jwt> refreshJwt() async {
    final jwt = await _jwtRepository.getJwt();
    if (jwt == null) return null;

    return await _jwtRepository.refreshToken(jwt);
  }
}
