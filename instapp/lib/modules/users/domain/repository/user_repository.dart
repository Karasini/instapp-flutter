import 'package:instapp/modules/users/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getUserById(String id);
}
