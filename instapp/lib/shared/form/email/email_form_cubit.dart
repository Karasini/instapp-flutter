
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'email.dart';

part 'email_form_state.dart';

class EmailFormCubit extends Cubit<EmailFormState> {
  EmailFormCubit() : super(EmailFormState());

  emailChanged(String email) => emit(state.copyWith(email: Email.dirty(email)));
}