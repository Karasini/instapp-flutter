import 'package:injectable/injectable.dart';
import 'package:instapp/modules/users/domain/models/user.dart';
import 'package:instapp/modules/users/infrastructure/user_repository/src/user_repository.dart';

abstract class GetUserByIdUseCase {
  Future<User> execute(String id);
}

@injectable
class GetUserByIdUseCaseImpl implements GetUserByIdUseCase {
  final UserRepository _userRepository;

  GetUserByIdUseCaseImpl(this._userRepository);

  Future<User> execute(String id) {
    var result = _userRepository.getUserById(id);
    return result;
  }
}
