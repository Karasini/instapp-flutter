import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instapp/shared/form/password/password_form_cubit.dart';

class PasswordInput extends StatelessWidget {
  final PasswordFormCubit passwordFormCubit;

  const PasswordInput(this.passwordFormCubit) : super();

  @override
  Widget build(BuildContext context) {
    return new BlocProvider(
        create: (_) => passwordFormCubit,
        child: BlocBuilder<PasswordFormCubit, PasswordFormState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return TextField(
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (password) =>
                  context.read<PasswordFormCubit>().passwordChanged(password),
              obscureText: true,
              decoration: InputDecoration(
                labelText: state.password.label(),
                errorText: state.password.errorText(),
              ),
            );
          },
        ));
  }
}
