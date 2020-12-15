import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/config/di/di.dart';

import 'app_view.dart';
import 'modules/login/presentation/cubits/authentication_bloc.dart';
import 'modules/login/domain/repository/auth_repository.dart';

@Injectable()
class App extends StatelessWidget {
  final AuthenticationCubit authenticationCubit;

  const App({this.authenticationCubit}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => authenticationCubit,
      child: AppView(),
    );
  }
}