import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/Infrastructure/jwt_repository.dart';

@injectable
class DeleteJwtUserCase {
  final JwtRepository _jwtRepository;

  DeleteJwtUserCase(this._jwtRepository);

  Future<void> deleteJwt() async => await _jwtRepository.deleteJwt();
}