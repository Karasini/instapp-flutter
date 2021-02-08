import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';

@injectable
class DeleteJwtUserCase {
  final JwtStorageRepositoryAbstract _jwtStorageRepository;

  DeleteJwtUserCase(this._jwtStorageRepository);

  Future<void> deleteJwt() async => await _jwtStorageRepository.deleteJwt();
}