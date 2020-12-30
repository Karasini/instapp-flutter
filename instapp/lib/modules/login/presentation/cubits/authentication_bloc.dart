import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/usecases/get_or_refresh_token_usecase.dart';
import 'package:instapp/modules/login/domain/usecases/delete_jwt_usecase.dart';
import 'package:instapp/modules/login/domain/usecases/refresh_jwt_usecase.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._deleteJwtUserCase, this._refreshJwtUserCase, this._getOrRefreshTokenUseCase) : super(const AuthenticationState.unknown());

  final GetOrRefreshTokenUseCase _getOrRefreshTokenUseCase;
  final DeleteJwtUserCase _deleteJwtUserCase;
  final RefreshJwtUserCase _refreshJwtUserCase;

  @override
  Future<void> close() {
    return super.close();
  }

  Future<void> checkAuth() async {
    var jwt = await _getOrRefreshTokenUseCase.getOrRefresh();
    if (jwt != null) {
      emit(AuthenticationState.authenticated(jwt));
    } else {
      emit(AuthenticationState.unauthenticated());
    }
  }

  Future<void> logout() async {
    await _deleteJwtUserCase.deleteJwt();
    checkAuth();
  }

  Future<void> refresh() async {
    await _refreshJwtUserCase.refreshJwt();
    await checkAuth();
  }

}
