import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/Infrastructure/jwt_repository.dart';
import 'package:instapp/modules/login/domain/jwt.dart';

@injectable
class GetJwtUseCase {
  final JwtRepository _jwtRepository;

  GetJwtUseCase(this._jwtRepository);

  Future<Jwt> getJwt() async => await _jwtRepository.getJwt();
}