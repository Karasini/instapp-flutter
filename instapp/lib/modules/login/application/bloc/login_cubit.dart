
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:instapp/modules/app/router.gr.dart';
import 'package:instapp/modules/login/domain/repository/auth_repository.dart';
import 'package:instapp/modules/login/ui/models/email.dart';
import 'package:instapp/modules/login/ui/models/password.dart';
import 'package:logger/logger.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginState());

  final AuthRepository _authRepository;

  emailChanged(String email) {
    final formEmail = Email.dirty(email);
    emit(state.copyWith(email: formEmail, status: Formz.validate([formEmail, state.password])));
  }

  passwordChanged(String password) {
    final formPassword = Password.dirty(password);
    emit(state.copyWith(password: formPassword, status: Formz.validate([state.email, formPassword])));
  }

  Future<void> submit() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _authRepository.logIn(state.email.value, state.password.value);
    if(result) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } else {
    emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

}
