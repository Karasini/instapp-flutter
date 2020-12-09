import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:instapp/config/di/di.dart';
import 'package:instapp/modules/login/Infrastructure/authentication_repository/authentication_repository.dart';
import 'package:instapp/modules/login/application/bloc/login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  const LoginPage({Key key, @required this.authenticationRepository})
      : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => LoginPage(
              authenticationRepository: getIt<AuthenticationRepository>(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
                authenticationRepository: authenticationRepository);
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
