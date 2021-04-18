part of 'email_form_cubit.dart';

class EmailFormState extends Equatable {
  const EmailFormState({
    this.email = const Email.pure(),
  });

  final Email email;

  EmailFormState copyWith({
    required Email email,
  }) {
    return EmailFormState(email: email ?? this.email);
  }

  @override
  List<Object> get props => [email];
}