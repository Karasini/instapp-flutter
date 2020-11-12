// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) {
  return AuthToken(
    access_token: json['access_token'] as String,
    expires_in: json['expires_in'] as int,
    token_type: json['token_type'] as String,
    refresh_token: json['refresh_token'] as String,
    scope: json['scope'] as String,
  );
}

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'expires_in': instance.expires_in,
      'token_type': instance.token_type,
      'refresh_token': instance.refresh_token,
      'scope': instance.scope,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.109.1:5000/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<AuthToken> requestToken(
      grant_type, client_id, username, password, scope) async {
    ArgumentError.checkNotNull(grant_type, 'grant_type');
    ArgumentError.checkNotNull(client_id, 'client_id');
    ArgumentError.checkNotNull(username, 'username');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(scope, 'scope');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'grant_type': grant_type,
      'client_id': client_id,
      'username': username,
      'password': password,
      'scope': scope
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/connect/token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = AuthToken.fromJson(_result.data);
    return value;
  }
}
