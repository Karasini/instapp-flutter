import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';

@Injectable(as: JwtStorageRepositoryAbstract)
class JwtStorageRepository implements JwtStorageRepositoryAbstract {
  final FlutterSecureStorage _storage;

  final accessTokenKey = "jwt.accessToken";
  final refreshTokenKey = "jwt.refreshToken";
  final expirationDateKey = "jwt.expirationDate";

  JwtStorageRepository(this._storage);

  Future<Jwt?> getJwt() async {

    var results = await Future.wait([
      _storage.read(key: accessTokenKey),
      _storage.read(key: refreshTokenKey),
      _storage.read(key: expirationDateKey)]);

    if(results[2] == null) return null;

    return new Jwt(results[0], results[1], DateTime.parse(results[2]!));
  }

  Future<void> saveJwt(Jwt jwt) async {
    await Future.wait([
      _storage.write(key: accessTokenKey, value: jwt.accessToken),
      _storage.write(key: refreshTokenKey, value: jwt.refreshToken),
      _storage.write(key: expirationDateKey,
          value: jwt.accessTokenExpirationDateTime?.toIso8601String()),
    ]);
  }

  Future<void> deleteJwt() async {
    await Future.wait([
      _storage.delete(key: accessTokenKey),
      _storage.delete(key: refreshTokenKey),
      _storage.delete(key: expirationDateKey),
    ]);
  }
}
