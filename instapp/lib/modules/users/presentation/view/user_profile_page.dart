import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instapp/modules/app/presentation/layout/app_scaffold.dart';
import 'package:instapp/modules/app/presentation/theme/cubits/theme_cubit.dart';
import 'package:instapp/modules/home/presentation/welcome_user.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';

class UserProfilePage extends StatelessWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => UserProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<ThemeCubit>().state;
    var themeCubit = context.read<ThemeCubit>();
    var authCubit = context.read<AuthenticationCubit>();

    return AppScaffold(
      widget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WelcomeUser(),
            Text("IsLightTheme: ${themeState.isLightTheme}"),
            ElevatedButton(
              onPressed: () {
                themeCubit.toggleTheme();
              },
              child: Text(themeState.isLightTheme ? "Set dark" : "Set light"),
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () async {
                await authCubit.logout();
                ExtendedNavigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Refresh'),
              onPressed: () {
                authCubit.refresh();
              },
            ),
            ElevatedButton(
              child: const Text('Invoke checkAuth'),
              onPressed: () {
                authCubit.checkIfJwtIsValid();
              },
            )
          ],
        ),
      ),
    );
  }
}
