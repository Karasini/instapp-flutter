import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:instapp/config/di/di.dart';
import 'package:instapp/modules/login/application/authentication/authentication.dart';
import 'package:instapp/modules/login/application/bloc/login_cubit.dart';
import 'package:instapp/modules/login/domain/repository/auth_repository.dart';
import 'login_form.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  final AuthRepository authRepository;

  const LoginPage({Key key, @required this.authRepository}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => LoginPage(
              authRepository: getIt<AuthRepository>(),
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
            return LoginCubit(authRepository);
          },
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                context.read<AuthenticationCubit>().logout();
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Authentication Failure')),
                  );
              }
              if (state.status.isSubmissionSuccess) {
                context.read<AuthenticationCubit>().login();
                ExtendedNavigator.of(context).pop();
              }
            },
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
