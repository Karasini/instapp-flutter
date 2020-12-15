part of 'password_form_cubit.dart';

class PasswordFormState extends Equatable {
  const PasswordFormState({
    this.password = const Password.pure(),
  });

  final Password password;

  PasswordFormState copyWith({
    Password password,
  }) {
    return PasswordFormState(password: password ?? this.password);
  }

  @override
  List<Object> get props => [password];
}