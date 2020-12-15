import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState.unknown());

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
