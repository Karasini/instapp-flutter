import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instapp/modules/app/presentation/routes/router.gr.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginOrUserButton extends StatelessWidget {
  const LoginOrUserButton({
    Key key,
    @required this.authStatus,
    @required this.authCubit,
  }) : super(key: key);

  final AuthenticationStatus authStatus;
  final AuthenticationCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (authStatus != AuthenticationStatus.authenticated) {
          return TextButton(
            onPressed: () async {
              await authCubit.login();
            },
            child: Text(AppLocalizations.of(context).homePageLogin,
                style: TextStyle(
                  fontSize: 18,
                )),
          );
        } else {
          return TextButton(
            onPressed: () {
              ExtendedNavigator.of(context).push(Routes.userProfilePage);
            },
            child: Text(AppLocalizations.of(context).homePageHiUserButton,
                style: TextStyle(
                  fontSize: 18,
                )),
          );
        }
      },
    );
  }
}
