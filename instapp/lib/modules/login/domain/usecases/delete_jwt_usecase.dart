import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

@injectable
class DeleteJwtUserCase {
  final JwtRepositoryAbstract _jwtRepository;

  DeleteJwtUserCase(this._jwtRepository);

  Future<void> deleteJwt() async => await _jwtRepository.deleteJwt();
}