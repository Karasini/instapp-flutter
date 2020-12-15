import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:instapp/modules/login/presentation/cubits/login_form_cubit.dart';
import 'package:instapp/shared/form/email/email_input.dart';
import 'package:instapp/shared/form/password/password_input.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EmailInput(context.watch<LoginFormCubit>().emailCubit),
          const Padding(padding: EdgeInsets.all(12)),
          PasswordInput(context.watch<LoginFormCubit>().passwordCubit),
          const Padding(padding: EdgeInsets.all(12)),
          _LoginButton(),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('Login'),
                onPressed: state.status.isValidated
                    ? () => context.read<LoginFormCubit>().submit()
                    : null,
              );
      },
    );
  }
}
