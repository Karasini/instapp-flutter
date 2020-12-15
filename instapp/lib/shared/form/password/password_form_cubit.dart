
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'password.dart';

part 'password_form_state.dart';

class PasswordFormCubit extends Cubit<PasswordFormState> {
  PasswordFormCubit() : super(PasswordFormState());

  passwordChanged(String password) => emit(state.copyWith(password: Password.dirty(password)));
}