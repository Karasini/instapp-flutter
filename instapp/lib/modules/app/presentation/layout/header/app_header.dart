import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';

import 'login_or_user_button.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({Key key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthenticationCubit>();
    var authStatus = context.watch<AuthenticationCubit>().state.status;

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: SvgPicture.asset("assets/icons/instapp_logo.svg"),
          ),
          Spacer(),
          LoginOrUserButton(authStatus: authStatus, authCubit: authCubit)
        ],
      ),
    );
  }
}