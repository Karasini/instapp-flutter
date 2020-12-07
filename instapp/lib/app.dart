import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/config/di/di.dart';
import 'package:instapp/modules/login/Infrastructure/authentication_repository/authentication_repository.dart';

import 'app_view.dart';
import 'modules/login/application/authentication/bloc/authentication_bloc.dart';

@Injectable()
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(
        authenticationRepository: getIt<AuthenticationRepository>()
      ),
      child: AppView(),
    );
  }
}