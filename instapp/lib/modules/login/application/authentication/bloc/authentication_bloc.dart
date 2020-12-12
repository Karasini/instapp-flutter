import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instapp/modules/login/Infrastructure/authentication_repository/src/rest_auth_repository.dart';
import 'package:meta/meta.dart';
part 'authentication_state.dart';

class AuthenticationCubit
    extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    @required MockAuthRepository authenticationRepository
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown());

  final MockAuthRepository _authenticationRepository;

  @override
  Future<void> close() {
    return super.close();
  }

  void login() {
    emit(AuthenticationState.authenticated());
  }

  void logout() {
    emit(AuthenticationState.unauthenticated());
  }
}
