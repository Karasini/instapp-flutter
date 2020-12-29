import 'dart:convert';

class Jwt {
  /// The access token returned by the authorization server.
  final String accessToken;

  /// The refresh token returned by the authorization server.
  final String refreshToken;

  /// Indicates when [accessToken] will expire.
  ///
  /// To ensure applications have continue to use valid access tokens, they
  /// will generally use the refresh token to get a new access token
  /// before it expires.
  final DateTime accessTokenExpirationDateTime;

  Jwt(this.accessToken, this.refreshToken, this.accessTokenExpirationDateTime);

  String getUserId() {
    var json = parseJwtPayLoad(accessToken);
    return json['sub'];
  }

  String getJsonFromJWT(){
    final parts = accessToken.split('.');
    final payload = parts[1];
    String normalizedSource = base64Url.normalize(payload);
    return utf8.decode(base64Url.decode(normalizedSource));
  }

  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  Map<String, dynamic> parseJwtHeader(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[0]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String normalizedSource = base64Url.normalize(str);
    return utf8.decode(base64Url.decode(normalizedSource));
  }
}
