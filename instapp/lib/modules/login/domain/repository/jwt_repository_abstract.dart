import 'package:instapp/modules/login/domain/jwt.dart';

abstract class JwtRepositoryAbstract {

  Future<Jwt> getJwt();
  Future<void> saveJwt(Jwt jwt);
  Future<void> deleteJwt();
  Future<Jwt> login();
  Future<Jwt> refreshToken(Jwt jwt);
}