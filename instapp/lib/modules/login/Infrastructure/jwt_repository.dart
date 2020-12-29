import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:instapp/modules/login/domain/jwt.dart';

class JwtRepository {
  final FlutterSecureStorage _storage;

  JwtRepository(this._storage);

  Future<Jwt> getJwt() async {
    var results = await Future.wait([
      _storage.read(key: "jwt.accessToken"),
      _storage.read(key: "jwt.refreshToken"),
      _storage.read(key: "jwt.expirationDate")]);

    return new Jwt(results[0], results[1], DateTime.parse(results[3]));
  }

  Future<void> saveJwt(Jwt jwt) async {
   await Future.wait([
     _storage.write(key: "jwt.accessToken", value: jwt.accessToken),
     _storage.write(key: "jwt.refreshToken", value: jwt.refreshToken),
     _storage.write(key: "jwt.expirationDate", value: jwt.accessTokenExpirationDateTime.toIso8601String()),
   ]);
  }
}