import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';

@injectable
class GetJwtUseCase {
  final JwtRepositoryAbstract _jwtRepository;

  GetJwtUseCase(this._jwtRepository);

  Future<Jwt> getJwt() async => await _jwtRepository.getJwt();
}