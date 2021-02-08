import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/usecases/login_usecase.dart';

part 'login_form_state.dart';

@injectable
class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit(this._loginUseCase) : super(LoginFormState());

  final LoginUseCase _loginUseCase;

  Future<void> submit() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _loginUseCase.logIn();
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess, error: ""));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure, error: result.error));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
