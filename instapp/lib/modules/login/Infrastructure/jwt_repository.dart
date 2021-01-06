import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/app/app_logger.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';

@Injectable(as: JwtRepositoryAbstract)
class JwtRepository implements JwtRepositoryAbstract {
  final FlutterAppAuth _appAuth;
  final JwtStorageRepositoryAbstract _jwtStorageRepository;

  final String _clientId = 'api_client';
  final String _redirectUrl = 'pl.instapp:/oauthredirect';
  final String _discoveryUrl =
      'https://ce231d8c824f.ngrok.io/.well-known/openid-configuration';
  final List<String> _scopes = <String>[
    'openid',
    'profile',
    'offline_access',
    'IdentityServerApi'
  ];

  final AuthorizationServiceConfiguration _serviceConfiguration =
  AuthorizationServiceConfiguration(
      'https://ce231d8c824f.ngrok.io/connect/authorize',
      'https://ce231d8c824f.ngrok.io/connect/token');

  JwtRepository(this._appAuth, this._jwtStorageRepository);

  Future<Jwt> login() async {
    AuthorizationTokenResponse result = await authorizeAndGetToken();
    var jwt = new Jwt(result.accessToken, result.refreshToken, result.accessTokenExpirationDateTime);
    await _jwtStorageRepository.saveJwt(jwt);
    return jwt;
  }

  Future<Jwt> refreshToken(Jwt jwt) async {
    Jwt result;
    try {
      TokenResponse token = await getToken(jwt);
      result = new Jwt(token.accessToken, token.refreshToken, token.accessTokenExpirationDateTime);
      await _jwtStorageRepository.saveJwt(result);
    } catch (e) {
      logger.d(e);
    }
    return result;
  }

  Future<TokenResponse> getToken(Jwt jwt) async {
    return await _appAuth.token(TokenRequest(
        _clientId, _redirectUrl,
        refreshToken: jwt.refreshToken,
        discoveryUrl: _discoveryUrl,
        scopes: _scopes));
  }

  Future<AuthorizationTokenResponse> authorizeAndGetToken() async {
    return await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _clientId,
        _redirectUrl,
        serviceConfiguration: _serviceConfiguration,
        scopes: _scopes,
        preferEphemeralSession: false,
      ),
    );
  }
}