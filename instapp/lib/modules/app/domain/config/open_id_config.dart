import 'package:json_annotation/json_annotation.dart';

part 'open_id_config.g.dart';

@JsonSerializable()
class OpenIdConfig {
  final String clientId;
  final String redirectUrl;
  final String discoveryUrl;
  final List<String> scopes;
  final String authorizeUrl;
  final String tokenUrl;

  OpenIdConfig(this.clientId, this.redirectUrl, this.discoveryUrl, this.scopes, this.authorizeUrl, this.tokenUrl);

  factory OpenIdConfig.fromJson(Map<String, dynamic> json) => _$OpenIdConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OpenIdConfigToJson(this);

}