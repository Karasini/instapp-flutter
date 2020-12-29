import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/Infrastructure/jwt_repository.dart';

import '../jwt.dart';

@injectable
class LoginUserCase {
  final JwtRepository _jwtRepository;
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

  LoginUserCase(this._jwtRepository, this._appAuth);

  Future<bool> logIn() async {
    try {
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
      await _jwtRepository.saveJwt(jwt);

    } catch (_) {
      return false;
    }

    return true;
  }
}
