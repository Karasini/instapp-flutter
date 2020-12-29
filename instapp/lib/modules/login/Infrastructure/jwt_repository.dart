import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';

@injectable
class JwtRepository {
  final FlutterSecureStorage _storage;

  JwtRepository(this._storage);

  Future<Jwt> getJwt() async {
    var results = await Future.wait([
      _storage.read(key: "jwt.accessToken"),
      _storage.read(key: "jwt.refreshToken"),
      _storage.read(key: "jwt.expirationDate")]);

    if(results[2] == null) return null;

    return new Jwt(results[0], results[1], DateTime.parse(results[2]));
  }

  Future<void> saveJwt(Jwt jwt) async {
    await Future.wait([
      _storage.write(key: "jwt.accessToken", value: jwt.accessToken),
      _storage.write(key: "jwt.refreshToken", value: jwt.refreshToken),
      _storage.write(key: "jwt.expirationDate",
          value: jwt.accessTokenExpirationDateTime.toIso8601String()),
    ]);
  }

  Future<void> deleteJwt() async {
    await Future.wait([
      _storage.delete(key: "jwt.accessToken"),
      _storage.delete(key: "jwt.refreshToken"),
      _storage.delete(key: "jwt.expirationDate"),
    ]);
  }
}