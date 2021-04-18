import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';
import 'package:instapp/modules/login/domain/usecases/refresh_jwt_usecase.dart';

@injectable
class GetOrRefreshTokenUseCase {
  final JwtStorageRepositoryAbstract _jwtStorageRepository;
  final RefreshJwtUserCase _refreshJwtUserCase;

  GetOrRefreshTokenUseCase(this._refreshJwtUserCase, this._jwtStorageRepository);

  Future<Jwt?> getOrRefresh() async {
    final jwt = await _jwtStorageRepository.getJwt();

    if(jwt == null) return null;

    return jwt.isExpired() ? await refreshToken() : jwt;
  }

  Future<Jwt?> refreshToken() async {
    return _refreshJwtUserCase.refreshJwt();
  }
}