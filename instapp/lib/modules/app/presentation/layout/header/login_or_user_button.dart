import 'package:flutter/material.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginOrUserButton extends StatelessWidget {
  const LoginOrUserButton({
    Key? key,
    required this.authStatus,
    required this.authCubit,
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
            child: Text(AppLocalizations.of(context)!.homePageLogin,
                style: TextStyle(
                  fontSize: 18,
                )),
          );
        } else {
          return TextButton(
            onPressed: () {
              //TODO: go to user profile
            },
            child: Text(AppLocalizations.of(context)!.homePageHiUserButton,
                style: TextStyle(
                  fontSize: 18,
                )),
          );
        }
      },
    );
  }
}
