import 'package:injectable/injectable.dart';
import 'package:instapp/modules/app/app_logger.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';

@injectable
class RefreshJwtUserCase {
  final JwtStorageRepositoryAbstract _jwtStorageRepository;
  final JwtRepositoryAbstract _jwtRepository;

  RefreshJwtUserCase(this._jwtStorageRepository, this._jwtRepository);

  Future<Jwt?> refreshJwt() async {
    var jwt = await _jwtStorageRepository.getJwt();
    if (jwt == null) return null;
    try {
      jwt = await _jwtRepository.refreshToken(jwt);
      if (jwt != null) await _jwtStorageRepository.saveJwt(jwt);
    } catch (e) {
      logger.d(e);
    }
    return jwt;
  }
}
