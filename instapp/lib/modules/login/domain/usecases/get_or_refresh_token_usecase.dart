import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';
import 'package:instapp/modules/login/domain/usecases/login_usecase.dart';
import 'package:instapp/modules/login/domain/usecases/refresh_jwt_usecase.dart';

@injectable
class GetOrRefreshTokenUseCase {
  final JwtRepositoryAbstract _jwtRepository;
  final LoginUseCase _loginUseCase;
  final RefreshJwtUserCase _refreshJwtUserCase;

  GetOrRefreshTokenUseCase(this._jwtRepository, this._loginUseCase, this._refreshJwtUserCase);

  Future<Jwt> getOrRefresh() async {
    final jwt = await _jwtRepository.getJwt();

    if(jwt == null) return null;

    return jwt.isExpired() ? refreshToken() : jwt;
  }

  Future<Jwt> refreshToken() async {
    Jwt jwt;
    try {
      jwt = await _refreshJwtUserCase.refreshJwt();
    } catch (_) {
    }
    return jwt;
  }

}
