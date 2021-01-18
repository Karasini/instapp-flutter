import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instapp/config/di/di.dart';
import 'package:instapp/modules/app/presentation/routes/router.gr.dart';
import 'package:instapp/modules/home/presentation/welcome_user.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';
import 'package:instapp/modules/login/presentation/cubits/login_form_cubit.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WelcomeUser(),
            RaisedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationCubit>()
                    .logout();
              },
            ),
            RaisedButton(
              child: const Text('Refresh'),
              onPressed: () {
                context
                    .read<AuthenticationCubit>()
                    .refresh();
              },
            ),
            RaisedButton(
              child: const Text('Invoke checkAuth'),
              onPressed: () {
                context
                    .read<AuthenticationCubit>()
                    .checkIfJwtIsValid();
              },
            ),
            RaisedButton(
              child: const Text('Go to Login Page'),
              onPressed: () {
                ExtendedNavigator.of(context).push(Routes.loginPage, arguments: LoginPageArguments(loginFormCubit: getIt<LoginFormCubit>()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
