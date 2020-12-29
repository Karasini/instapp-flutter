import 'package:injectable/injectable.dart';
import 'package:instapp/modules/users/domain/models/user.dart';
import 'package:instapp/modules/users/infrastructure/user_repository/src/user_repository.dart';

@injectable
class GetUserByIdUseCase {
  final UserRepository _userRepository;

  GetUserByIdUseCase(this._userRepository);

  Future<User> execute() {
    var result = _userRepository.getUserById("");

    return Future.value();
  }
}
