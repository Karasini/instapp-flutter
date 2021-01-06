import 'package:instapp/modules/login/domain/jwt.dart';

abstract class JwtStorageRepositoryAbstract {
  Future<Jwt> getJwt();
  Future<void> saveJwt(Jwt jwt);
  Future<void> deleteJwt();
}