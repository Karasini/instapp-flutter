import 'package:instapp/modules/login/domain/jwt.dart';

abstract class JwtRepositoryAbstract {
  Future<Jwt> login();

  Future<Jwt> refreshToken(Jwt jwt);
}
