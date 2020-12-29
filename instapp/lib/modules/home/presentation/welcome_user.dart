import 'package:flutter/material.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Builder(
          builder: (context) {
            final state = context.select(
                  (AuthenticationCubit bloc) => bloc.state,
            );
            if (state.status == AuthenticationStatus.authenticated) {
              return Text('Hello: ${state.userId}');
            } else {
              return Text('User not logged in');
            }
          },
        ),
      ],
    );
  }
}
