import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/login/domain/usecases/login_usercase.dart';
import 'package:instapp/shared/form/email/email.dart';
import 'package:instapp/shared/form/email/email_form_cubit.dart';
import 'package:instapp/shared/form/password/password.dart';
import 'package:instapp/shared/form/password/password_form_cubit.dart';

part 'login_form_state.dart';

@injectable
class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit(this._loginUserCase) : super(LoginFormState()) {
    emailCubit = EmailFormCubit();
    emailSub = emailCubit.listen((emailState) {
      emit(state.copyWith(
          email: emailState.email,
          password: state.password,
          status: Formz.validate([emailState.email, state.password])));
    });
    passwordCubit = PasswordFormCubit();
    passwordSub = passwordCubit.listen((passwordState) {
      emit(state.copyWith(
          email: state.email,
          password: passwordState.password,
          status: Formz.validate([state.email, passwordState.password])));
    });
  }

  final LoginUserCase _loginUserCase;
  StreamSubscription emailSub;
  EmailFormCubit emailCubit;
  StreamSubscription passwordSub;
  PasswordFormCubit passwordCubit;

  passwordChanged(String password) {
    final formPassword = Password.dirty(password);
    emit(state.copyWith(
        password: formPassword,
        status: Formz.validate([state.email, formPassword])));
  }

  Future<void> submit() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result =
        await _loginUserCase.logIn(state.email.value, state.password.value);
    if (result) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  @override
  Future<void> close() {
    emailSub.cancel();
    passwordSub.cancel();
    return super.close();
  }
}
