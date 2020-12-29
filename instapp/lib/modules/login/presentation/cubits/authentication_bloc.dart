import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/Infrastructure/jwt_repository.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._jwtRepository) : super(const AuthenticationState.unknown());

  final JwtRepository _jwtRepository;

  @override
  Future<void> close() {
    return super.close();
  }

  Future<void> authenticated() async {
    var jwt = await _jwtRepository.getJwt();
    var userId = jwt.getUserId();
    emit(AuthenticationState.authenticated(userId));
  }

  void unauthenticated() {
    emit(AuthenticationState.unauthenticated());
  }
}
