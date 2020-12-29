part of 'login_form_cubit.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.status = FormzStatus.pure,
    this.error = ""
  });

  final FormzStatus status;
  final String error;

  LoginFormState copyWith({
    FormzStatus status,
    String error,
  }) {
    return LoginFormState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, error];
}
