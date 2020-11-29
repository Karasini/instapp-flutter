
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://192.168.109.1:5000/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/connect/token")
  @FormUrlEncoded()
  Future<AuthToken> requestToken(@Field() String grant_type,
      @Field() String client_id, @Field() String username,
      @Field() String password, @Field() String scope);
}

@JsonSerializable()
class AuthToken {
  String access_token;
  int expires_in;
  String token_type;
  String refresh_token;
  String scope;

  AuthToken({this.access_token, this.expires_in, this.token_type, this.refresh_token, this.scope});

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}