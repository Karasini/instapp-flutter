import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'models/models.dart';

@Singleton()
class UserRepository {
  UserDto _user;

  Future<UserDto> getUserById(String id) async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = UserDto(Uuid().v4()),
    );
  }
}
