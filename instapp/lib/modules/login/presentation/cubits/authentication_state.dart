part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, authenticating }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.jwt
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Jwt jwt)
      : this._(status: AuthenticationStatus.authenticated, jwt: jwt);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated, jwt: null);

  const AuthenticationState.authenticating()
      : this._(status: AuthenticationStatus.authenticating, jwt: null);

  final AuthenticationStatus status;
  final Jwt jwt;

  @override
  List<Object> get props => [status, jwt];
}
