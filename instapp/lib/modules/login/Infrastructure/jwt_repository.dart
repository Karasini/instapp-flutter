import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

@Injectable(as: JwtRepositoryAbstract)
class JwtRepository implements JwtRepositoryAbstract {
  final FlutterSecureStorage _storage;
  final FlutterAppAuth _appAuth;

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

  final accessTokenKey = "jwt.accessToken";
  final refreshTokenKey = "jwt.refreshToken";
  final expirationDateKey = "jwt.expirationDate";

  JwtRepository(this._storage, this._appAuth);

  Future<Jwt> getJwt() async {

    var results = await Future.wait([
      _storage.read(key: accessTokenKey),
      _storage.read(key: refreshTokenKey),
      _storage.read(key: expirationDateKey)]);

    if(results[2] == null) return null;

    return new Jwt(results[0], results[1], DateTime.parse(results[2]));
  }

  Future<void> saveJwt(Jwt jwt) async {
    await Future.wait([
      _storage.write(key: accessTokenKey, value: jwt.accessToken),
      _storage.write(key: refreshTokenKey, value: jwt.refreshToken),
      _storage.write(key: expirationDateKey,
          value: jwt.accessTokenExpirationDateTime.toIso8601String()),
    ]);
  }

  Future<void> deleteJwt() async {
    await Future.wait([
      _storage.delete(key: accessTokenKey),
      _storage.delete(key: refreshTokenKey),
      _storage.delete(key: expirationDateKey),
    ]);
  }

  Future<Jwt> login() async {
    final AuthorizationTokenResponse result =
    await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _clientId,
        _redirectUrl,
        serviceConfiguration: _serviceConfiguration,
        scopes: _scopes,
        preferEphemeralSession: false,
      ),
    );
    var jwt = new Jwt(result.accessToken, result.refreshToken, result.accessTokenExpirationDateTime);
    await saveJwt(jwt);
    return jwt;
  }

  Future<Jwt> refreshToken(Jwt jwt) async {
    Jwt result;
    try {
      final TokenResponse token = await _appAuth.token(TokenRequest(
          _clientId, _redirectUrl,
          refreshToken: jwt.refreshToken,
          discoveryUrl: _discoveryUrl,
          scopes: _scopes));

      result = new Jwt(token.accessToken, token.refreshToken, token.accessTokenExpirationDateTime);
      await saveJwt(result);
    } catch (e) {
    }
    return result;
  }
}