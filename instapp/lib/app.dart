import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'app_view.dart';
import 'modules/login/presentation/cubits/authentication_bloc.dart';

@Injectable()
class App extends StatelessWidget {
  final AuthenticationCubit authenticationCubit;

  const App({this.authenticationCubit}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        authenticationCubit.checkAuth();
        return authenticationCubit;
      },
      child: AppView(),
    );
  }
}