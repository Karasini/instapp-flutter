import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';

@injectable
class GetJwtUseCase {
  final JwtStorageRepositoryAbstract _jwtStorageRepository;

  GetJwtUseCase(this._jwtStorageRepository);

  Future<Jwt> getJwt() async => await _jwtStorageRepository.getJwt();
}