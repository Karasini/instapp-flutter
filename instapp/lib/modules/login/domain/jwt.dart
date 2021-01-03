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

  String userId;

  Jwt(this.accessToken, this.refreshToken, this.accessTokenExpirationDateTime) {
    parseAccessToken();
  }

  void parseAccessToken() {
    var json = parseJwtPayLoad(accessToken);
    userId = json['sub'];
  }

  bool isExpired() {
    return DateTime.now().isAfter(accessTokenExpirationDateTime);
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

  String _decodeBase64(String str) {
    String normalizedSource = base64Url.normalize(str);
    return utf8.decode(base64Url.decode(normalizedSource));
  }
}
