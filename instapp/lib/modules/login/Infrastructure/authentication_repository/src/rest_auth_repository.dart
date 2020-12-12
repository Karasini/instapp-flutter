import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/repository/auth_repository.dart';
import 'package:meta/meta.dart';

@Singleton(as: AuthRepository)
class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> logIn(String email, String password) async {
    return password == "qwerty"
        ? Future.delayed(const Duration(milliseconds: 300), () => true)
        : Future.delayed(const Duration(milliseconds: 300), () => false);
  }

  @override
  Future<void> logOut() {}
}
