import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/app/app_logger.dart';
import 'package:instapp/modules/app/domain/config/config_repository_abstract.dart';
import 'package:instapp/modules/app/domain/config/open_id_config.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';

@Injectable(as: JwtRepositoryAbstract)
class JwtRepository implements JwtRepositoryAbstract {
  final FlutterAppAuth _appAuth;
  final JwtStorageRepositoryAbstract _jwtStorageRepository;
  final ConfigRepositoryAbstract _configRepository;

  OpenIdConfig _openIdConfig;

  JwtRepository(
      this._appAuth, this._jwtStorageRepository, this._configRepository) {
    _openIdConfig = _configRepository.getOpenId();
  }

  Future<Jwt> login() async {
    AuthorizationTokenResponse result = await authorizeAndGetToken();
    var jwt = new Jwt(result.accessToken, result.refreshToken,
        result.accessTokenExpirationDateTime);
    await _jwtStorageRepository.saveJwt(jwt);
    return jwt;
  }

  Future<Jwt> refreshToken(Jwt jwt) async {
    Jwt result;
    try {
      TokenResponse token = await getToken(jwt);
      result = new Jwt(token.accessToken, token.refreshToken,
          token.accessTokenExpirationDateTime);
      await _jwtStorageRepository.saveJwt(result);
    } catch (e) {
      logger.d(e);
    }
    return result;
  }

  Future<TokenResponse> getToken(Jwt jwt) async {
    return await _appAuth.token(TokenRequest(
        _openIdConfig.clientId, _openIdConfig.redirectUrl,
        refreshToken: jwt.refreshToken,
        discoveryUrl: _openIdConfig.discoveryUrl,
        scopes: _openIdConfig.scopes));
  }

  Future<AuthorizationTokenResponse> authorizeAndGetToken() async {
    final serviceConfig = AuthorizationServiceConfiguration(
        _openIdConfig.authorizeUrl,
        _openIdConfig.tokenUrl);

    return await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _openIdConfig.clientId,
        _openIdConfig.redirectUrl,
        serviceConfiguration: serviceConfig,
        scopes: _openIdConfig.scopes,
        preferEphemeralSession: false,
      ),
    );
  }
}
