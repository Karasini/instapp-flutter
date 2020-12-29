part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.userId = ""
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(String userId)
      : this._(status: AuthenticationStatus.authenticated, userId: userId);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated, userId: "");

  final AuthenticationStatus status;
  final String userId;

  @override
  List<Object> get props => [status, userId];
}
