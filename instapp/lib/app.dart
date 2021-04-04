import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/app/presentation/theme/cubits/theme_cubit.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';

import 'app_view.dart';

@Injectable()
class App extends StatelessWidget {
  final AuthenticationCubit authenticationCubit;
  final ThemeCubit themeCubit;

  const App({this.authenticationCubit, this.themeCubit}) : super();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) {
        authenticationCubit.checkIfJwtIsValid();
        return authenticationCubit;
      }),
      BlocProvider(
        create: (_) => themeCubit,
      )
    ], child: AppView());
  }
}
