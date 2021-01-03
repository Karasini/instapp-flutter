import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:instapp/config/di/di.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';
import 'package:instapp/modules/login/presentation/cubits/login_form_cubit.dart';
import 'login_form.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  final LoginFormCubit loginFormCubit;

  const LoginPage({Key key, @required this.loginFormCubit}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => LoginPage(
              loginFormCubit: getIt<LoginFormCubit>(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) => loginFormCubit,
          child: BlocListener<LoginFormCubit, LoginFormState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                context.read<AuthenticationCubit>().checkIfJwtIsValid();
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text("Error: ${state.error}")),
                  );
              }
              if (state.status.isSubmissionSuccess) {
                context.read<AuthenticationCubit>().checkIfJwtIsValid();
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
