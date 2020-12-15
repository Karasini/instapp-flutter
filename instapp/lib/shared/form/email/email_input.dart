import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'email_form_cubit.dart';

class EmailInput extends StatelessWidget {
  final EmailFormCubit emailFormCubit;

  const EmailInput(this.emailFormCubit) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => emailFormCubit,
        child: BlocBuilder<EmailFormCubit, EmailFormState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return TextField(
              key: const Key('loginForm_emailInput_textField'),
              onChanged: (email) =>
                  context.read<EmailFormCubit>().emailChanged(email),
              decoration: InputDecoration(
                labelText: state.email.label(),
                errorText: state.email.errorText(),
              ),
            );
          },
        ));
  }
}